#!/bin/bash

####Peak scoreing by HMMRATAC_V1.2.10
#samtools faidx GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna
#cut -f 1-2 GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.fai > alb-chr.size
#To remove mito from .bam#/home/radhika/samtools-1.11/samtools idxstats AAT1_ctad.sdup.bam| cut -f 1 | grep -v AC_027937 | xargs /home/radhika/samtools-1.11/samtools view -b AAT1_ctad.sdup.bam > AAT1.filtered.bam#

for i in `ls AAT*.filtered.bam `
do

j=`echo "$i" |sed 's/\.filtered.bam//'`
BLA=/home/radhika/atac/info-g/Dalb-at.v1.blacklist.bed
BLN=/home/radhika/atac/info-g/Dnas-at-dalb.v1.blacklist.bed
ALB=/home/radhika/atac/info-g/chr.size

echo albomicans started

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g "$ALB" -e $BLA -q 20 --bedgraph true --bgscore true -o "$j"_0

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 30 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_1 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 30 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_2

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 30 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_3

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 40 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_4  

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 40 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_5  

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 40 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_6

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 50 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_7

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 50 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_8   

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 50 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_9

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 60 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_10 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 60 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_11 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 60 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_12
echo albomicans done
done

for i in `ls ANT*.shifted.bam`
do 
j=`echo "$i" |sed 's/\.filtered.bam//'`
echo nasuta now
java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -q 20 --bedgraph true --bgscore true -o "$j"_0

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 30 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_1 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 30 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_2

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 30 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_3

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 40 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_4  

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 40 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_5  

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 40 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_6

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 50 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_7

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 50 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_8   

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 50 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_9

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 60 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_10 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 60 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_11 

java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLN -u 60 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_12
echo done
done
