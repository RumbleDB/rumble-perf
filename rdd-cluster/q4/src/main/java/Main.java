import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.json.JSONObject;
import scala.Tuple2;

import java.io.Serializable;

public class Main {
    public static void main(String[] args) {

        long start = System.nanoTime();
        SparkConf sparkConf = new SparkConf()
                .setAppName("Java Query 4");
                // .setMaster("local[*]");  // Delete this line when submitting to a cluster
        JavaSparkContext sparkContext = new JavaSparkContext(sparkConf);
        JavaRDD<String> textFile = sparkContext.textFile("hdfs:///user/hadoop/confusion-2014-03-02-*.json");


        JavaRDD<JSONObject> jsonInput = textFile.map(line -> new JSONObject(line));
        JavaRDD<JSONObject> filtered = jsonInput.filter(new ApplyFilter());
        JavaRDD<JSONDataRow> dataRow = filtered.map(jsonObj -> new JSONDataRow(jsonObj.getString("guess"), jsonObj.getString("target"), jsonObj.getString("country"), jsonObj.getJSONArray("choices"), jsonObj.getString("sample"), jsonObj.getString("date")));

        JavaPairRDD<Tuple2, JSONDataRow> pairs = dataRow.mapToPair(obj ->
                new Tuple2(new ComparisonKey(obj.getTarget(), obj.getCountry(), obj.getDate()), obj));
        JavaPairRDD<Tuple2, JSONDataRow> sortedPairs = pairs.sortByKey(false);
        JavaRDD<JSONDataRow> result = sortedPairs.map(obj -> obj._2);


        //result.map(obj -> obj.toString()).collect().forEach(line -> System.out.println(line));
        result.map(obj -> obj.toString()).saveAsTextFile("hdfs:///user/hadoop/output4");
        long end = System.nanoTime();
        System.out.println(((end - start) / 1000000) + "milliseconds");
    }

    public static class ApplyFilter implements Function<JSONObject, Boolean> {
        public Boolean call(JSONObject jsonObj) {
            String guessString = jsonObj.getString("guess");
            String targetString = (jsonObj.getString("target"));
            if (guessString.equals(targetString)) {
                return true;
            } else {
                return false;
            }
        }
    }

    public static class ComparisonKey implements Comparable<ComparisonKey>, Serializable {
        private String target;
        private String country;
        private String date;

        ComparisonKey(String t, String c, String d) {
            this.target = t;
            this.country = c;
            this.date = d;
        }

        @Override
        public int compareTo(ComparisonKey o) {
            Integer compareTarget = o.target.compareTo(this.target);        // ascending order
            if (compareTarget != 0) {
                return compareTarget;
            } else {
                Integer compareCountry = this.country.compareTo(o.country); // descending order
                if (compareCountry != 0) {
                    return compareCountry;
                } else {
                    Integer compareDate = this.date.compareTo(o.date); // descending order
                    return compareDate;
                }
            }
        }
    }


}
