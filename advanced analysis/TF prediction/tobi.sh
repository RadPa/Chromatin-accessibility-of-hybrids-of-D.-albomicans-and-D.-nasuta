#!/bin/bash

####TF prediction using TOBIAS v0.12.11####

FA=/home/radhika/atac/tff/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna
PEAK=/home/radhika/atac/tff/tobi/tes.nfr.sh.ann.bed
BLA=/home/radhika/atac/info-g/Dalb-pub.sm.v1.blacklist.bed
JAS22=/home/radhika/atac/tff/JASPAR2022_CORE_insects_non-redundant_pfms_jaspar.txt

echo ATACorrect 
TOBIAS ATACorrect --bam AAT.mer.bam --genome "$FA" --peaks "$PEAK" --blacklist "$BLA" --cores 16 --prefix AAT
TOBIAS ATACorrect --bam ANT.mer.bam --genome "$FA" --peaks "$PEAK" --blacklist "$BLA" --cores 16 --prefix ANT

echo footprint-scores
TOBIAS ScoreBigwig --signal AAT_corrected.bw --regions "$PEAK" --output AAT_footprints.bw --cores 16
TOBIAS ScoreBigwig --signal ANT_corrected.bw --regions "$PEAK" --output ANT_footprints.bw --cores 16

echo BINDetect
TOBIAS BINDetect --signals AAT_footprints.bw ANT_footprints.bw --peaks "$PEAK" --motifs "$JAS22" --genome "$FA" --cond-names alb nas --prefix j22 --outdir ajp22 --cores 16

#For Network
#Extracting all the nas bound beds
for i in `ls -d */`
do
j=`echo "$i"|sed 's/\///g'`
echo "$j"
awk '{gsub(/gene-/, "")} {print}' "$i"beds/"$j"_nas_bound.bed > /home/radhika/atac/tff/tobi/nas/"$j".nas.bed
done

echo CreateNetwork
TOBIAS CreateNetwork --TFBS nas/*.bed --origin motif2gene.txt --outdir net150
TOBIAS CreateNetwork --TFBS nas/*.bed --origin motif2gene115.txt --outdir net115

echo TOBIAS done
