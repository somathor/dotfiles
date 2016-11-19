#!/bin/bash

max=$1

for i in `seq 1 $max`
do

  num1=`expr $i \* 2 - 1`
  num2=`expr $i \* 2`

  pnum1=`printf "%03d" "$num1"`
  pnum2=`printf "%03d" "$num2"`

  convert -append "$pnum1.jpeg" "$pnum2.jpeg" "output-$i.jpg"
done
