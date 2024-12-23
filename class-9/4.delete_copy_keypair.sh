#!/bin/bash 

pub_key=$(echo $1)
key_name=$2
copy_key_pair() { 
   aws ec2 import-key-pair --key-name $2 --public-key-material ${pub_key}  --region ${region} }
   
for region in $@; do 
copy_key_pair ${region} 
done 
 