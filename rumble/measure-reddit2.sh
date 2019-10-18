#!/bin/bash

> ./log-executors.txt

  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-2x.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 2x >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt

  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --num-executors 126 --executor-cores 1 --executor-memory 2GB --conf spark.dynamicAllocation.enabled=false  spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter-4x.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo 4x >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
