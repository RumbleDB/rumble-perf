import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;

public class Main {
    public static void main(String[] args) {

        long start = System.nanoTime();
        SparkSession spark = SparkSession
                .builder()
                .appName("DataFrames Query 4")
                .getOrCreate();

        Dataset<Row> confusion = spark.read().json("hdfs:///user/hadoop/confusion-2014-03-02-*.json");

        confusion.createOrReplaceTempView("confusion");

        Dataset<Row> result = spark.sql("SELECT * FROM confusion WHERE target = guess ORDER BY target, country DESC, date DESC");
        
        result.write().json("hdfs:///user/hadoop/output4");
        
        long end = System.nanoTime();
        System.out.println(((end - start) / 1000000) + "milliseconds");

    }
}
