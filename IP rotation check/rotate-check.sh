#!/bin/bash
while :
do
	echo "waking up"
	domain=$1
	dig_output=$(dig +nocmd +noall +answer +ttlid a $domain | cut -f 3)
	ipaddress="$(dig $domain +short)"
	output_file=$(echo $domain | cut -d "." -f 1)
	echo "writing"
	echo -e "$domain,${ipaddress}" >> "${output_file}-cumulative-addresses.txt"
	echo "sleeping"
	sleep 1h
done
