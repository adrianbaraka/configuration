#!/bin/bash

echo -n "Enter the IP Address: "
read ip_address

#get the info from ipinfo
curl https://ipinfo.io/$ip_address
