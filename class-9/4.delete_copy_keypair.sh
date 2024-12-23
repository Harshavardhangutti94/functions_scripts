#!/bin/bash 
pub_key=$(echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYGTIk35MAjHJkDffOZaXuikCZBzIva5uB5FXm+3CMSD4zuzCQjpgnrbAx2JuU6hdHgEUPvUt72xbc1jZ0TFXJT4Q7PG7ocrYLkQDp73aMEi0R6FxGCln5GgWtyYI45vvlGUlnunvMiRHR+rHUFRjcSb9/MGEewS2wMM6hqLbmeLl+lvtVAqgLjIrFEFMUlINsPT6WXx0mbj8u6L3g15iWH0xWA2etu4pkzu3eb0CMXhQs7k/F3bRwccFmh/p3/CHN3jICWbjNkl3r7R276TrbxRDUwlDjfuE3//hj3nC/XVR1HBBOAGyPC1HS0yqOp8jZmVo/J858T20bjsEgqLu9')
copy_key_pair() { 
   aws ec2 import-key-pair --key-name $1 --public-key-material ${pub_key} --region ${region} 
   echo "Key Pair Copied to Region:${region}"
   }
   
regions=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
for region in ${regions}; do 
if [ ${region} == 'us-east-1' ]; then
    copy_key_pair $1 
fi
done 
 