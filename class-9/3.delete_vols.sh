#!/bin/bash 
del_vols() {
vol_id=$(aws ec2 describe-volumes --region $1 | jq ".Volumes[].volumeId" -r)
for i in ${vol_id}; do 
   vol_size=$(aws ec2 describe-volumes --volume-id ${i} --region $1 | jq ".Volumes[].Size" -r)
   vol_state=$(aws ec describe-volumes --volume-id ${i} --region $1 |jq ".Volumes[].State" -r)
    if [ ${vol_size} -gt 5 -a ${vol_state} == "in-use" ]; then 
        echo "Valid Volume.." 
    else 
        echo"Invalid volume .... Deleting volume ${i}" 
        aws ec2 delete-volume --volume-id ${i}
    fi 
    done 
    } 

Region=$(aws ec2 describe-regions | jq ".Regions[].RegionName" -r)
for k in ${Region[@]}; do 
    del_vols ${k}
done