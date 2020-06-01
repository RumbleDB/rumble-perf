#!/bin/bash

reps=25

> ./log-tail-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path tail_base.jq --output-path output-tail-l-base --log-path ./log-tail-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-tail-l-base-tmp.txt >> ./log-tail-l-base.txt
  rm -rf ./output-tail-l-base
done

> ./log-sub-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path subsequence_base.jq --output-path output-sub-l-base --log-path ./log-sub-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-sub-l-base-tmp.txt >> ./log-sub-l-base.txt
  rm -rf ./output-sub-l-base
done

> ./log-rev-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path reverse_base.jq --output-path output-rev-l-base --log-path ./log-rev-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-rev-l-base-tmp.txt >> ./log-rev-l-base.txt
  rm -rf ./output-rev-l-base
done

> ./log-rm-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path remove_base.jq --output-path output-rm-l-base --log-path ./log-rm-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-rm-l-base-tmp.txt >> ./log-rm-l-base.txt
  rm -rf ./output-rm-l-base
done

> ./log-oom-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path one-or-more_base.jq --output-path output-oom-l-base --log-path ./log-oom-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-oom-l-base-tmp.txt >> ./log-oom-l-base.txt
  rm -rf ./output-oom-l-base
done

> ./log-ib-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path insert-before_base.jq --output-path output-ib-l-base --log-path ./log-ib-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-ib-l-base-tmp.txt >> ./log-ib-l-base.txt
  rm -rf ./output-ib-l-base
done

> ./log-io-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path index-of_base.jq --output-path output-io-l-base --log-path ./log-io-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-io-l-base-tmp.txt >> ./log-io-l-base.txt
  rm -rf ./output-io-l-base
done

> ./log-de-l-base.txt

for i in `seq 1 $reps`;
do
  spark-submit --driver-memory 16g --master local[*] spark-rumble-1.4.2.jar --query-path deep-equal_base.jq --output-path output-de-l-base --log-path ./log-de-l-base-tmp.txt --overwrite yes --result-size 100000000
  cat ./log-de-l-base-tmp.txt >> ./log-de-l-base.txt
  rm -rf ./output-de-l-base
done
