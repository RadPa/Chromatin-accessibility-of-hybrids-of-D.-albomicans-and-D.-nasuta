#!/bin/bash

####Peak scoreing by HMMRATAC_V1.2.10####
#cut -f 1-2 GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.fai > alb-chr.size


for i in `ls *.shifted.bam`
do

j=`echo "$i" |sed 's/.shifted.bam//'`
BLA=/home/morpheus/radhika/peaks/Dalb-pub.sm.v1.blacklist.bed
ALB=/home/morpheus/radhika/peaks/chr.size

echo "$j" started

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g "$ALB" -e $BLA -q 20 --bedgraph true --bgscore true -o "$j"_0

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 30 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_1 

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 30 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_2

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 30 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_3

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 40 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_4  

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 40 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_5  

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 40 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_6

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 50 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_7

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 50 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_8   

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 50 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_9

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 60 -l 10 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_10 

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 60 -l 15 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_11 

java -jar /home/morpheus/atac/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g $ALB -e $BLA -u 60 -l 20 -q 20 --bedgraph true --bedgraph true --bgscore true -o "$j"_12
echo "$j" done
done
