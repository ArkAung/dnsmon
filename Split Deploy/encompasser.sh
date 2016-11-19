#!/bin/bash 
script="domain.sh"
filelist_file="nodefile_output"
pwd
ls ./files/ > "$filelist_file"
while read -r file
do
 echo "Running command on $file"
 nohup ./domain.sh "./files/$file" &
done < "$filelist_file"
