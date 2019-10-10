#!/bin/bash

reps=5

#> ./log1.txt

#for i in `seq 1 $reps`;
#do
#  (time zorba -f -q q1.jq -o output1.json) 2> ./log1-tmp.txt
#  cat ./log1-tmp.txt >> ./log1.txt
#done

#> ./log4.txt

#for i in `seq 1 $reps`;
#do
#  (time zorba -f -q q4.jq -o output4.json) 2> ./log4-tmp.txt
#  cat ./log4-tmp.txt >> ./log4.txt
#done

> ./log5.txt

for i in `seq 1 $reps`;
do
  (time zorba -f -q q5.jq -o output5.json) 2> ./log5-tmp.txt
  cat ./log5-tmp.txt >> ./log5.txt
done


