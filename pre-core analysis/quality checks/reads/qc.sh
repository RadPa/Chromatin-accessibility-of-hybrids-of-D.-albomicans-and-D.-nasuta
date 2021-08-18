#!/bin/bash

#Fastqc v0.11.9 for raw reads of atac-seq 
for i in `ls /home/hp1/radhika/atac/rawreads/pre-trim/*.gz` 
do
echo "$i"
/home/hp1/radhika/FastQC/fastqc "$i" 
echo "$i" done
done

#Cutadapt v2.8 for adaptor removal
source /home/hp1/radhika/py3-env/bin/activate
for i in `ls *_1.fastq.gz`
do
j=`echo "$i"|sed 's/_1.fastq.gz/_2.fastq.gz/'`
k=`echo "$i"|sed 's/_1.fastq.gz/_ct_1.fastq.gz/'`
l=`echo "$j"|sed 's/_2.fastq.gz/_ct_2.fastq.gz/'`
m=`echo "$i"|sed 's/_1.fastq.gz//'`
echo "$m" started 
#Nextera adapter sequences for ATAC-seq
cutadapt -a CTGTCTCTTATACACATCT -A CTGTCTCTTATACACATCT -j 16 -o "$k" -p "$l" "$i" "$j"
echo "$m" done
done

#Multiqc v1.11
source /home/hp1/radhika/py3-env/bin/activate 
multiqc -s -i rawqc reads/
