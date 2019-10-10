#!/bin/bash

reps=5

> ./log1.txt

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output1
  spark-submit spark-rumble-1.1-i.jar --query-path /home/hadoop/q1.jq --output-path hdfs:///user/hadoop/output1 --log-path ./log1-tmp.txt
  cat ./log1-tmp.txt >> ./log1.txt
done

> ./log4.txt

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output4
  spark-submit --driver-memory 5G spark-rumble-1.1-i.jar --query-path /home/hadoop/q4.jq --output-path output4 --log-path ./log4-tmp.txt
  cat ./log4-tmp.txt >> ./log4.txt
done

> ./log5.txt

for i in `seq 1 $reps`;
do
  hadoop fs -rm -r hdfs:///user/hadoop/output5
  spark-submit --driver-memory 5G spark-rumble-1.1-i.jar --query-path /home/hadoop/q5.jq --output-path output5 --log-path ./log5-tmp.txt
  cat ./log5-tmp.txt >> ./log5.txt
done