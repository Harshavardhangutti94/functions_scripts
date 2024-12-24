#!/bin/bash 
str=$1
length1=$(echo -n $str | wc -c)
length2=${#str} 
for(( i=0; i<$(expr length2); i++ )); do
     echo '${STR[@]:$i:1}'
     done