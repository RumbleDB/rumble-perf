#!/bin/bash

reps=5

> ./log5.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 5G spark-rumble-1.1-i.jar --query-path q5.jq --output-path output5 --log-path ./log5-tmp.txt --overwrite yes
  cat ./log5-tmp.txt >> ./log5.txt
done


