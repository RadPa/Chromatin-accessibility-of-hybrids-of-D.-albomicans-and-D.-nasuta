#!/bin/bash
cd /home/morpheus/radhika/aln

#### Bowtie version 2.4.4 ####
##  Genome indexing ##
# 1min 25s in Morpheus #
#/home/morpheus/radhika/bowtie2-2.4.4-linux-x86_64/bowtie2-build --threads 32 -f GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna /home/morpheus/radhika/aln/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna--no-mixed --no-discordant

for i in `ls *_1.fastq.gz`
do 

j=`echo "$i" | sed 's/_1/_2/g'` 
k=`echo "$i" | sed 's/_ct_1.fastq.gz//g'` 

## Mapping, format conversions and Stats ##
# Mapping #
echo mapping "$k"
/home/morpheus/radhika/bowtie2-2.4.4-linux-x86_64/bowtie2 -X 750 --very-sensitive --no-mixed --no-discordant -p 32 --seed 21 -x GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna -1 "$i" -2 "$j" |/home/morpheus/radhika/samtools-1.14/samtools view -@ 32 -bo "$k".bam

# Tidying the data #
echo tidying "$k"
/home/morpheus/radhika/samtools-1.14/samtools sort -@ 32 "$k".bam -o "$k".sbam
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32 "$k".sbam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".sbam
/home/morpheus/radhika/samtools-1.14/samtools view -@ 32 -b -f 2 -F 524 "$k".sbam > "$k".ft.bam
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32"$k".ft.bam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".ft.bam

## Filtering data ##
# Removing Mitochondrial reads #
echo removing mito reads of "$k"
/home/morpheus/radhika/samtools-1.14/samtools idxstats "$k".ft.bam| cut -f 1 | grep -v NC_027937.1 | xargs /home/morpheus/radhika/samtools-1.14/samtools view -@ 32 -b "$k".ft.bam|/home/morpheus/radhika/samtools-1.14/samtools sort -@ 32 -o "$k".mtrm.bam
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32 "$k".mtrm.bam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".mtrm.bam

# Removing Duplicates #
echo marking duplicates of "$k"
/home/morpheus/gatk-4.2.2.0/gatk MarkDuplicates -I "$k".mtrm.bam -O "$k".mtdrm.bam -M "$k".mtdrm.txt -REMOVE_DUPLICATES True
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32 "$k".mtdrm.bam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".mtdrm.bam
/home/morpheus/gatk-4.2.2.0/gatk CollectInsertSizeMetrics -I "$k".mtdrm.bam -O "$k".mtdrm.is_metrics.txt -H "$k".mtdrm.his.pdf -M 0.5
echo "$k" done
done
