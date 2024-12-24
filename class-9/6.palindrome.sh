#!/bin/bash 
str=$1
length1=$(echo -n $str | wc -c)
length2=${#str} 
for i in range $length2; do
     echo ${STR[@]:$i:1}
     done