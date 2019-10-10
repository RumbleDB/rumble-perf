#!/bin/bash

> ./log1.txt

for i in `seq 1 45`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output1
  spark-submit --num-executors $i --conf spark.dynamicAllocation.enabled=false spark-rumble-1.1-i.jar --query-path ./q1-one.jq --output-path hdfs:///user/hadoop/output1 --log-path ./log1-tmp.txt
  echo $i >> ./log1.txt
  cat ./log1-tmp.txt >> ./log1.txt
done
