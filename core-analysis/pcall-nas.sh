#!/bin/bash 

cd /home/radhika/atac/peaks/ 

####Peak czscoreing by MMRATAC_V1.2.10 

#samtools faidx GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna 

#cut -f 1-2 GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.fai > alb-chr.size 

#To remove mito from .bam#/home/radhika/samtools-1.11/samtools idxstats AA1_ctad.sdup.bam| cut -f 1 | grep -v NC_027937 | xargs /home/radhika/samtools-1.11/samtools view -b AA1_ctad.sdup.bam > AA1_ctad.sdup-M.bam# 

  

#BAM=/home/radhika/atac/peaks/ANT2_ct.filtered.bam 

#BAI=/home/radhika/atac/peaks/ANT2_ct.filtered.bam.bai 

#OUT=/home/radhika/atac/peaks/ANT2_ct.b 

for i in `ls ANT*.filtered.bam` 

do 

BLT=Dnas-at-dalb.v1.blacklist.bed 

j=`echo "$i" |sed 's/\.filtered.bam//'` 

 

echo nasuta peak calling 

echo "$i" 
 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT --bedgraph true --bgscore true -o "$j".b_0 

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 30 -l 10 --bedgraph true --bedgraph true --bgscore true -o "$j".b_1  

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 30 -l 15 --bedgraph true --bedgraph true --bgscore true -o "$j".b_2 

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 30 -l 20 --bedgraph true --bedgraph true --bgscore true -o "$j".b_3 

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 40 -l 10 --bedgraph true --bedgraph true --bgscore true -o "$j".b_4   

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 40 -l 15 --bedgraph true --bedgraph true --bgscore true -o "$j".b_5   

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 40 -l 20 --bedgraph true --bedgraph true --bgscore true -o "$j".b_6 

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 10 --bedgraph true --bedgraph true --bgscore true -o "$j".b_7 

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 15 --bedgraph true --bedgraph true --bgscore true -o "$j".b_8    

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 50 -l 20 --bedgraph true --bedgraph true --bgscore true -o "$j".b_9 

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 10 --bedgraph true --bedgraph true --bgscore true -o "$j".b_10  

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 15 --bedgraph true --bedgraph true --bgscore true -o "$j".b_11  

 java -jar /home/radhika/HMMRATAC_V1.2.10_exe.jar -b "$i" -i "$i".bai -g alb-chr.size -e $BLT -u 60 -l 20 --bedgraph true --bedgraph true --bgscore true -o "$j".b_12 

 echo "$j" 

done 
