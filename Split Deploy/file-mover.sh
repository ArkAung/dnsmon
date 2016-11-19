#!/bin/sh
for i in `seq 0 9`; do
	mkdir -p "node-$i"
done

all_domains_filename=$1
split -d -l 1000 $all_domains_filename "node"
for i in `seq 0 9`; do
cp domain.sh node-$i
cp encompasser.sh node-$i
mkdir "node-$i/files"
    for j in `seq 0 9`; do
        mv "node$i$j" "node-$i/files/"
    done
done
