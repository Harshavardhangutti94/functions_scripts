#!/bin/bash 
str=$1
b=1
rev=''
length1=$(echo -n $str | wc -c)
length2=${#str} 
#for(( i=0; i<${length2}; i++ )); do
for (( i=($length2-$b); i>=0 ; i--)); do
      rev="$rev${str[@]:$i:1}" 
done
if [ $str == $rev ];
then 
    echo "The given string is a palindrome"
else 
    echo "The given string is not a palindrome"
fi

