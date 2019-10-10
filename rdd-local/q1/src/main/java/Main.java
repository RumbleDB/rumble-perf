import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.json.JSONObject;

public class Main {
    public static void main(String[] args) {

        long start = System.nanoTime();
        SparkConf sparkConf = new SparkConf().setAppName("Java Query 1");
        JavaSparkContext sparkContext = new JavaSparkContext(sparkConf);
        JavaRDD<String> textFile = sparkContext.textFile("hdfs:///user/hadoop/confusion-2014-03-02-*.json");


        JavaRDD<JSONObject> jsonInput = textFile.map(line -> new JSONObject(line));
        JavaRDD<JSONObject> filtered = jsonInput.filter(new ApplyFilter());
        filtered.map(obj -> obj.toString()).saveAsTextFile("hdfs:///user/hadoop/output1");

        long end = System.nanoTime();
        System.out.println(((end - start) / 1000000) + "milliseconds");

    }

    public static class ApplyFilter implements Function<JSONObject, Boolean> {
        public Boolean call(JSONObject jsonObj) {
            String guessString = jsonObj.getString("guess");
            String targetString = (jsonObj.getString("target"));
            if (guessString.equals(targetString) && targetString.equals("Russian")) {
                return true;
            } else {
                return false;
            }
        }
    }
}
