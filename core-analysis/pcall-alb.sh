#!/bin/bash

####Peak czscoreiAg by MMRATAC_V1.2.10
#samtools faidx GCF_009650485.1_drosAlbom15112-1751.03v1_geAomic.fAa
#cut -f 1-2 GCF_009650485.1_drosAlbom15112-1751.03v1_geAomic.fAa.fai > alb-chr.size
#To remove mito from .bam#/home/radhika/samtools-1.11/samtools idxstats AA1_ctad.sdup.bam| cut -f 1 | grep -v AC_027937 | xargs /home/radhika/samtools-1.11/samtools view -b AA1_ctad.sdup.bam > AA1_ctad.sdup-M.bam#


#i=/home/radhika/atac/peaks/AAT2_ct.filtered.bai
#BAI=/home/radhika/atac/peaks/AAT2_ct.filtered.bam.bai
#j=/home/radhika/atac/peaks/AAT2_ct.b

for i in `ls AAT.filtereds.bam`
do

j=`echo "$i" |sed 's/\.filtereds.bam//'`
BLT=Dalb-at.v1.blacklist.bed

echo albomicans peak calling
echo "$j"

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -q 20 --bedgraph true --bgscore true -o "$j".q2_0

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 30 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_1 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 30 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_2

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 30 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_3

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 40 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_4  

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 40 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_5  

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 40 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_6

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_7

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_8   

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_9

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_10 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_11 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_12

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 25 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_13

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 30 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j".q2_14

done
