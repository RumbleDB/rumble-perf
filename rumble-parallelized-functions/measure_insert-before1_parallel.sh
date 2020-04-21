#!/bin/bash

reps=25

> ./log-ib-p.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-ib-p
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path insert-before1.jq --output-path output-ib-p --log-path ./log-ib-p-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-ib-p-tmp.txt >> ./log-ib-p.txt
done
