#!/bin/bash

reps=5

> ./log-executors.txt

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-1.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 1 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-2.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 2 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-4.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 4 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-8.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 8 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-16.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 16 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-32.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 32 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-64.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 64 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-all.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 100 >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done