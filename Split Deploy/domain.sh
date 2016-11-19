#!/bin/bash 
filename="$1"
today=$(date '+%d_%m_%y')
while read -r domain
do
 echo $domain
 ipaddress="$(dig $domain +short | tr '\n' ' ')"
 dig_output=$(dig +nocmd +noall +answer +ttlid a $domain | cut -f 2-6 | tr '\n' ' ')
 nameserver="$(whois $domain | grep 'Name Server' | cut -d ":" -f 2 | sed 's/ //' | sed -e :a -e '$!N;s/ \n/,/;ta' | tr '\n' ' ')"
 echo -e "$domain ${dig_output} ${ipaddress} ${nameserver}" >> ${today}_details.csv
done < "$filename"
