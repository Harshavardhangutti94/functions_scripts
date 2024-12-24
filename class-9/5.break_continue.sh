#!/bin/bash
domain=[ "www.google.com", "www.yahoo.com" ,"www.facebook.con" , "www.amazon.com" ]
if [ $# -gt 0 ]; then 
   for i in $domain; do 
    timeout 3 netcat -zv $i 443 >> /dev/null 2>&1 
    if [ $? -eq 0 ] ; then 
       echo "$i is up and running"
    else 
       echo "$i id down"
       break
    fi 
    done 
else 
    echo "Please provide the server ip to check"
fi 