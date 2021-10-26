#!/bin/bash
#Z840 workstation
cd /home/radhika/atac/aln/testes/

#### Bowtie version 2.4.4 ####

##  Genome indexing ##
# 1min 32s in Z840 #
/home/radhika/bowtie2-2.4.4-linux-x86_64/bowtie2-build --threads 32 -f GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna /home/radhika/atac/aln/testes/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna

for i in `ls *_1.fastq.gz`
do 

j=`echo "$i" | sed 's/_1/_2/g'` 
k=`echo "$i" | sed 's/_ct_1.fastq.gz//g'` 

## Mapping, format conversions and Stats ##
# Mapping #
echo mapping "$k"
/home/radhika/bowtie2-2.4.4-linux-x86_64/bowtie2 --very-sensitive -X 700 -p 16 --seed 21 -x GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna -1 "$i" -2 "$j"| /home/radhika/samtools-1.13/samtools view -@ 16 -bo "$k".bam

# Tidying the data #
echo tidying "$k"
/home/radhika/samtools-1.13/samtools sort -@ 16 "$k".bam -o "$k".sbam
/home/radhika/samtools-1.13/samtools index -@ 16 "$k".sbam
/home/radhika/samtools-1.13/samtools flagstat "$k".sbam

## Filtering data ##
# Marking Duplicates #
echo marking duplicates of "$k"
/home/radhika/gatk-4.2.2.0/gatk MarkDuplicates -I "$k".sbam -O "$k".sdm.bam -M "$k".sdmatr.txt -REMOVE_DUPLICATES false
/home/radhika/samtools-1.13/samtools index -@ 16 "$k".sdm.bam
/home/radhika/samtools-1.13/samtools flagstat "$k".sdm.bam
/home/radhika/gatk-4.2.2.0/gatk CollectInsertSizeMetrics -I "$k".sdm.bam -O "$k".sdm.is_metrics.txt -H "$k".sdm.is_histogram.pdf -M 0.5

# Removing Mitochondrial reads #
echo removing mito reads of "$k"
/home/radhika/samtools-1.13/samtools idxstats "$k".sdm.bam| cut -f 1 | grep -v NC_027937.1 | xargs /home/radhika/samtools-1.13/samtools view -@ 16 -b "$k".sdm.bam|/home/radhika/samtools-1.13/samtools sort -@ 16 -o "$k".sdm-mr.bam
/home/radhika/samtools-1.13/samtools index -@ 16 "$k".sdm-mr.bam
/home/radhika/samtools-1.13/samtools flagstat "$k".sdm-mr.bam

echo "$k" done
done
