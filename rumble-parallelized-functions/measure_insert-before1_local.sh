#!/bin/bash

reps=25

> ./log-ib-l.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-ib-l
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path insert-before1.jq --output-path output-ib-l --log-path ./log-ib-l-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-ib-l-tmp.txt >> ./log-ib-l.txt
done
