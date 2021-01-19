#!/bin/bash

#Trimming by NGmerge version 0.3\
for i in `ls *_R1_001.fastq.gz` \
do \

j=`echo "$i"| sed 's/_R1/_R2/g'` \ 

k=`echo "$i"| sed 's/_R1_001.fastq.gz//g'`\

echo "$j" \
/home/hp1/radhika/NGmerge/./NGmerge -a -d -1 "$i" -2 "$j" -o /home/hp1/radhika/atac/"$k"\
echo "$k" done\
done\
