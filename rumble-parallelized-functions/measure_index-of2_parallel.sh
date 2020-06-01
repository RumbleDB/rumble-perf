#!/bin/bash

reps=25

> ./log-io-p-2.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-p-2
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path index-of2.jq --output-path output-io-p-2 --log-path ./log-io-p-tmp-2.txt --overwrite yes --result-size 100000000
  cat ./log-io-p-tmp-2.txt >> ./log-io-p-2.txt
done
