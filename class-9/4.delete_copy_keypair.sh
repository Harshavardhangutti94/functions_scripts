#!/bin/bash 
pub_key=$(cat /tmp/file1)
copy_key_pair() { 
   aws ec2 import-key-pair --key-name $1 --public-key-material ${pub_key} --region ${region} 
   echo "Key Pair Copied to Region:${region}"
   }
   
regions=$(aws ec2 describe-regions | jq ".Regions[].RegionaName" -r)
for region in ${regions}; do 
if [ ${region} == 'us-east-1' ]; then 
   copy_key_pair ${key_name} 
fi
done 
 