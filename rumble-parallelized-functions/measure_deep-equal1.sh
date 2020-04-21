#!/bin/bash

rm -f ./log-de-*.txt

reps=25

> ./log-de-p.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path deep-equal1.jq --output-path output-de-p --log-path ./log-de-p-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-de-p-tmp.txt >> ./log-de-p.txt
done

> ./log-de-l.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path deep-equal1.jq --output-path output-de-l --log-path ./log-de-l-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-de-l-tmp.txt >> ./log-de-l.txt
done
