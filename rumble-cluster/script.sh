wget https://s3.eu-central-1.amazonaws.com/rumbledb.org/download/spark-rumble-1.1-i.jar
wget https://s3.eu-central-1.amazonaws.com/rumbledb.org/download/q1.jq
wget https://s3.eu-central-1.amazonaws.com/rumbledb.org/download/q4.jq
wget https://s3.eu-central-1.amazonaws.com/rumbledb.org/download/q5.jq
wget https://s3.eu-central-1.amazonaws.com/rumbledb.org/download/measure.sh

chmod u+x measure.sh

echo 'json-file("s3://rumbledb.org/download/confusion-2014-03-02.json")' > copy.jq

spark-submit spark-rumble-1.1-i.jar --query-path /home/hadoop/copy.jq --output-path hdfs:///user/hadoop/confusion-2014-03-02-01.json

hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-02.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-03.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-04.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-05.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-06.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-07.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-08.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-09.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-10.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-11.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-12.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-13.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-14.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-15.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-16.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-17.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-18.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-19.json
hadoop fs -cp hdfs:///user/hadoop/confusion-2014-03-02-01.json hdfs:///user/hadoop/confusion-2014-03-02-20.json
