#!/bin/bash
input=$1
while IFS= read -r var
do
  ./rotate-check.sh $var &
done < "$input"