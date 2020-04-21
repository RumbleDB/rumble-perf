#!/bin/bash

reps=25

> ./log-io-l-2.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-l-2
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path index-of2.jq --output-path output-io-2 --log-path ./log-io-l-tmp-2.txt --overwrite yes --result-size 100000000
  cat ./log-io-l-tmp-2.txt >> ./log-io-l-2.txt
done
