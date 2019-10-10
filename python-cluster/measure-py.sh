#!/bin/bash

reps=5

> ./log1.txt

cd q1

for i in `seq 1 $reps`;
do
    hadoop fs -rm -r hdfs:///user/hadoop/output1
    spark-submit ./q1.py | grep milliseconds >> ../log1.txt
done

cd ..

> ./log4.txt

cd q4

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    hadoop fs -rm -r hdfs:///user/hadoop/output4
    spark-submit --files ./Key.py --driver-memory 5G ./q4.py | grep milliseconds >> ../log4.txt
done

cd ..

> ./log5.txt

cd q5

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    hadoop fs -rm -r hdfs:///user/hadoop/output5
    spark-submit --files ./Key.py --driver-memory 5G ./q5.py | grep milliseconds >> ../log5.txt
done

cd ..

