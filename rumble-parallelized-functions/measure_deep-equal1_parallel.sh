#!/bin/bash

reps=25

> ./log-de-p.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-de-p
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path deep-equal1.jq --output-path output-de-p --log-path ./log-de-p-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-de-p-tmp.txt >> ./log-de-p.txt
done
