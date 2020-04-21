#!/bin/bash

reps=25

> ./log-de-l.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-de-l
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path deep-equal1.jq --output-path output-de-l --log-path ./log-de-l-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-de-l-tmp.txt >> ./log-de-l.txt
done
