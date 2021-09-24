#!/bin/bash
#Z840 workstation
cd /home/radhika/atac/aln/testes/

#### Bowtie version 2.4.2 ####
##  Genome indexing ##
 
#30.64hrs on 10.01.21
for i in `ls *_1.fastq.gz`
do 

j=`echo "$i" | sed 's/_1/_2/g'` 

k=`echo "$i" | sed 's/_1.fastq.gz//g'` 

FA=/home/radhika/atac/info-g/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna

echo mapping "$k"
##Mapping and format conversions##
#Indexing#
/home/radhika/bowtie2-2.4.2-sra-linux-x86_64/bowtie2-build --threads 16 -f $FA
#Mapping#
/home/radhika/bowtie2-2.4.2-sra-linux-x86_64/bowtie2 -p 32 --very-sensitive -X 1000 --seed 21 -x $FA -1 "$i" -2 "$j" | /home/radhika/samtools-1.11/samtools view -b -o "$k".bam
/home/radhika/samtools-1.11/samtools sort "$k".bam -o "$k".sbam 

echo samtools "$k"
##Statistics## 
/home/radhika/samtools-1.11/samtools index "$k".sbam
/home/radhika/samtools-1.11/samtools flagstat "$k".sbam > "$k".sbam.stat 

##Filtering .bam##
echo marking duplicates
##Duplicates marked by picardtools## 
/home/radhika/gatk-4.1.9.0/./gatk MarkDuplicates -I "$k".sbam -O "$k".dup.bam -M "$k".dupmatr.txt -REMOVE_DUPLICATES false 
/home/radhika/samtools-1.11/samtools sort "$k".dup.bam -o "$k".sdup.bam
/home/radhika/samtools-1.11/samtools index "$k".sdup.bam
/home/radhika/samtools-1.11/samtools flagstat "$k".sdup.bam > "$k".sdup.stat

echo "$k" done
done
