#!/bin/bash

reps=25

> ./log-tail-l-1.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-tail-l-1
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path tail1.jq --output-path output-tail-l-1 --log-path ./log-tail-l-1-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-tail-l-1-tmp.txt >> ./log-tail-l-1.txt
done
