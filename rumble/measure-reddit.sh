#!/bin/bash

reps=32

> ./log-executors.txt

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output-reddit
  spark-submit --conf spark.dynamicAllocation.enabled=false --executor-cores 1 --executor-memory 2G --num-executors $i spark-rumble-1.1-i.jar --query-path /home/hadoop/rumble-perf/rumble/reddit-filter.jq --output-path hdfs:///user/hadoop/output-reddit --log-path ./log1-tmp.txt
  echo $i >> ./log-executors.txt
  cat ./log1-tmp.txt >> ./log-executors.txt
done