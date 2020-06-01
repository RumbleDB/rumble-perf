#!/bin/bash

reps=25

> ./log-rm-p-1.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-rm-p-1
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path remove1.jq --output-path output-rm-p-1 --log-path ./log-rm-p-1-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-rm-p-1-tmp.txt >> ./log-rm-p-1.txt
done
