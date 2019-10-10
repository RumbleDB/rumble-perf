#!/bin/bash

reps=5

> ./log1.txt

cd q1

for i in `seq 1 $reps`;
do
    rm -rf ../output1
    spark-submit --master local[*] ./q1.py | grep milliseconds >> ../log1.txt
done

cd ..

> ./log4.txt

cd q4

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    rm -rf ../output4
    spark-submit --driver-memory 5G --master local[*] ./q4.py | grep milliseconds >> ../log4.txt
done

cd ..

> ./log5.txt

cd q5

for i in `seq 1 $reps`;
do
# remove existing folder before every iteration
    rm -rf ../output5
    spark-submit --driver-memory 5G --master local[*] ./q5.py | grep milliseconds >> ../log5.txt
done

cd ..

