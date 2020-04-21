#!/bin/bash

rm -f ./log-io-*.txt

reps=25

> ./log-io-p-1.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-p-1
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path index-of1.jq --output-path output-io-p-1 --log-path ./log-io-p-1-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-io-p-1-tmp.txt >> ./log-io-p-1.txt
done

> ./log-io-l-1.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-l-1
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path index-of1.jq --output-path output-io-l-1 --log-path ./log-io-l-1-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-io-l-1-tmp.txt >> ./log-io-l-1.txt
done
