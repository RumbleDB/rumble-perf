#!/bin/bash

reps=5

> ./log1.txt

for i in `seq 1 $reps`;
do
    rm -rf ./output1
    spark-submit --master local[*] ./q1/target/java-query-1-1.0-SNAPSHOT-jar-with-dependencies.jar | grep milliseconds >> ./log1.txt
done

> ./log4.txt

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    rm -rf ./output4
    spark-submit --master local[*] ./q4/target/java-query-4-1.0-SNAPSHOT-jar-with-dependencies.jar | grep milliseconds >> ./log4.txt
done

> ./log5.txt

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    rm -rf ./output5
    spark-submit --master local[*] ./q5/target/java-query-5-1.0-SNAPSHOT-jar-with-dependencies.jar | grep milliseconds >> ./log5.txt
done


