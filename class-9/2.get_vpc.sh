#!/bin/bash 

Get_vpc() {
    echo "Running function to list vpc in Region:$1"
    get_vpc=$(aws ec2 describe-vpcs --region $1 | jq ".Vpcs[].VpcId" -r)
     echo "${get_vpc} /n"
}

for region in $@; do 
    Get_vpc ${region}
    done 

Get_vpc 