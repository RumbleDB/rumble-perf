#!/bin/bash

reps=25

> ./log-tail-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-tail-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path tail_base.jq --output-path output-tail-p-base --log-path ./log-tail-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-tail-p-base-tmp.txt >> ./log-tail-p-base.txt
done

> ./log-sub-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-sub-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path subsequence_base.jq --output-path output-sub-p-base --log-path ./log-sub-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-sub-p-base-tmp.txt >> ./log-sub-p-base.txt
done

> ./log-rev-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-rev-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path reverse_base.jq --output-path output-rev-p-base --log-path ./log-rev-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-rev-p-base-tmp.txt >> ./log-rev-p-base.txt
done

> ./log-rm-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-rm-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path remove_base.jq --output-path output-rm-p-base --log-path ./log-rm-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-rm-p-base-tmp.txt >> ./log-rm-p-base.txt
done

> ./log-oom-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-oom-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path one-or-more_base.jq --output-path output-oom-p-base --log-path ./log-oom-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-oom-p-base-tmp.txt >> ./log-oom-p-base.txt
done

> ./log-ib-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-ib-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path insert-before_base.jq --output-path output-ib-p-base --log-path ./log-ib-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-ib-p-base-tmp.txt >> ./log-ib-p-base.txt
done

> ./log-io-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-io-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path index-of_base.jq --output-path output-io-p-base --log-path ./log-io-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-io-p-base-tmp.txt >> ./log-io-p-base.txt
done

> ./log-de-p-base.txt

for i in `seq 1 $reps`;
do
  rm -rf ./output-de-p-base
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.5.1.jar --query-path deep-equal_base.jq --output-path output-de-p-base --log-path ./log-de-p-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-de-p-base-tmp.txt >> ./log-de-p-base.txt
done
