#!/bin/bash 
pub_key=$(echo 'c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFDN2NqUzduL3JvajQrVmQ0dzRCR3hyYnZIUDVPa1dHMUtFUXh2eEF2VG8vZ0I4TTlDa2VtL09TYWNPdUVxcmtpdE0vYVdWQmhMN1hEOHRHYUFaTWVtS2srOEdORDIxWEJLUXloNURUQTdYVDdLOXdvdjlKWE5GVDh3YWowdzFsK0tuQ0pqcURsSGZmam4vNXZySlgzSkpQVHNmck9Gdzl1cFRZaXh2TzV0N2VzZ0lORExoS21TaFM1bUJSN2xQSXIzd0JFa1hoWjZhK1B5WW9BOEUvY3NqMHJOUVNiTFFRWjdRRnJWcHJqUUZ4UlkzZ1JiSXRvbUxaUVFDZkcwczVDaTBqYVR0N2hNanpSZXFBUlZwbmF6MnNldzZOam4xVGNvc3dEL0kwNk5yU09UcWxjVVBLa2FvVThvSHQ3VG9LTTlzaUEzYlUyOWdUQVF1blNVeEYrY2gK')
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
 