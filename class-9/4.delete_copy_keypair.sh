#!/bin/bash 
pub_key=$( echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7cjS7n/roj4+Vd4w4BGxrbvHP5OkWG1KEQxvxAvTo/gB8M9Ckem/OSacOuEqrkitM/aWVBhL7XD8tGaAZMemKk+8GND21XBKQyh5DTA7XT7K9wov9JXNFT8waj0w1l+KnCJjqDlHffjn/5vrJX3JJPTsfrOFw9upTYixvO5t7esgINDLhKmShS5mBR7lPIr3wBEkXhZ6a+PyYoA8E/csj0rNQSbLQQZ7QFrVprjQFxRY3gRbItomLZQQCfG0s5Ci0jaTt7hMjzReqARVpnaz2sew6Njn1TcoswD/I06NrSOTqlcUPKkaoU8oHt7ToKM9siA3bU29gTAQunSUxF+ch' | base64)
new_pub_key=$(echo $pub_key | tr -d " ")
copy_key_pair() { 
   aws ec2 import-key-pair --key-name $1 --public-key-material ${new_pub_key} --region ${region} 
   echo "Key Pair Copied to Region:${region}"
   }
   
for region in us-east-1 us-west-1 us-west-2; do
    copy_key_pair $1 ${region}
done 
 