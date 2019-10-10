import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.function.Function;
import org.json.JSONObject;
import scala.Tuple2;

import java.io.Serializable;
import java.util.Map;
import java.util.TreeSet;

public class Main {
    public static void main(String[] args) {

        long start = System.nanoTime();
        SparkConf sparkConf = new SparkConf()
                .setAppName("Java Query 5");
        JavaSparkContext sparkContext = new JavaSparkContext(sparkConf);
        JavaRDD<String> textFile = sparkContext.textFile("hdfs:///user/hadoop/confusion-2014-03-02-*.json");


        // aggregate by country and target -> count number of guesses

        JavaRDD<JSONObject> jsonInput = textFile.map(line -> new JSONObject(line));
        JavaRDD<JSONDataRow> dataRow = jsonInput.map(jsonObj -> new JSONDataRow(jsonObj.getString("guess"), jsonObj.getString("target"), jsonObj.getString("country"), jsonObj.getJSONArray("choices"), jsonObj.getString("sample"), jsonObj.getString("date")));

        JavaPairRDD<AggregationKey, JSONDataRow> pairs = dataRow.mapToPair(row ->
                new Tuple2(new AggregationKey(row.getCountry(), row.getTarget()), row));

        TreeSet<JSONDataRow> set = new TreeSet<JSONDataRow>();
        JavaPairRDD<AggregationKey, Long> aggData = pairs.combineByKey(new CreateCountCombiner(), new MergeCountValue(), new MergeCountCombiner());

        aggData.saveAsTextFile("hdfs:///user/hadoop/output5");

        long end = System.nanoTime();
        System.out.println(((end - start) / 1000000) + "milliseconds");
    }

    public static class AggregationKey implements Comparable<AggregationKey>, Serializable {
        private String country;
        private String target;
        private static final long serialVersionUID = 1L;

        public AggregationKey(String country, String target) {
            this.country = country;
            this.target = target;
        }


        /*
            Hashcode is used in partitioning function. Without this override, the grouping doesn't work properly.
         */
        @Override
        public int hashCode() {
            return (this.country + this.target).hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            return 0 == this.compareTo((AggregationKey) obj);
        }

        @Override
        public int compareTo(AggregationKey o) {
            Integer compareCountry = this.country.compareTo(o.country);         // ascending order
            if (compareCountry != 0) {
                return compareCountry;
            } else {
                Integer compareTarget = this.target.compareTo(o.target);        // ascending order
                return compareTarget;
            }
        }
    }

    /**
     * Merge within partition
     */
    public static class AggregationCase1 implements Function2<TreeSet<JSONDataRow>, JSONDataRow, TreeSet<JSONDataRow>> {
        public TreeSet<JSONDataRow> call(TreeSet<JSONDataRow> arg0, JSONDataRow arg1) {
            arg0.add(arg1);
            return arg0;
        }
    }

    /**
     * Merge across partition
     */
    public static class AggregationCase2 implements Function2<TreeSet<JSONDataRow>, TreeSet<JSONDataRow>, TreeSet<JSONDataRow>> {
        public TreeSet<JSONDataRow> call(TreeSet<JSONDataRow> arg0, TreeSet<JSONDataRow> arg1) {
            arg0.addAll(arg1);
            return arg0;
        }
    }



    /**
     * Count
     */
    public static class CreateCountCombiner implements Function<JSONDataRow, Long> {
        public Long call(JSONDataRow arg0) {
            return new Long(1);
        }
    }
    public static class MergeCountValue implements Function2<Long, JSONDataRow, Long> {
        public Long call(Long arg0, JSONDataRow arg1) {
            return arg0 + 1;
        }
    }
    public static class MergeCountCombiner implements Function2<Long, Long, Long> {
        public Long call(Long arg0, Long arg1) {
            return arg0 + arg1;
        }
    }


}
