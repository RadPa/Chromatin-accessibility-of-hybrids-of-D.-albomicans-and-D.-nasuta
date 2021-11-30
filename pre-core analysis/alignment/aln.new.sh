#!/bin/bash
cd /home/radhika/atac/aln/testes

#### Bowtie version 2.4.4 ####
##  Genome indexing ##
# 1min 32s in Z840 #
/home/morpheus/radhika/bowtie2-2.4.4-linux-x86_64/bowtie2-build --threads 32 -f GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna /home/radhika/atac/aln/testes/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna

for i in `ls *_1.fastq.gz`
do 

j=`echo "$i" | sed 's/_1/_2/g'` 
k=`echo "$i" | sed 's/_ct_1.fastq.gz//g'` 

## Mapping, format conversions and Stats ##
# Mapping #
echo mapping "$k"
/home/morpheus/radhika/bowtie2-2.4.4-linux-x86_64/bowtie2 --very-sensitive -X 700 --no-mixed --no-discordant --align-paired-reads -p 32 --seed 21 -x GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna -1 "$i" -2 "$j"| /home/morpheus/radhika/samtools-1.14/samtools view -@ 32 -bo -f 2 -F 524 "$k".pp.x7.bam

# Tidying the data #
echo tidying "$k"
/home/morpheus/radhika/samtools-1.14/samtools sort -@ 32 "$k".pp.x7.bam -o "$k".pp.x7.sbam
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32 "$k".pp.x7.sbam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".pp.x7.sbam

## Filtering data ##
# Removing Mitochondrial reads #
echo removing mito reads of "$k"
/home/morpheus/radhika/samtools-1.14/samtools idxstats "$k".pp.x7.sbam| cut -f 1 | grep -v NC_027937.1 | xargs /home/morpheus/radhika/samtools-1.14/samtools view -@ 32 -b "$k".pp.x7.sbam|/home/morpheus/radhika/samtools-1.14/samtools sort -@ 16 -o "$k".pp.x7.mtrm.bam
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32 "$k".pp.x7.mtrm.bam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".pp.x7.mtrm.bam

# Removing Duplicates #
echo marking duplicates of "$k"
/home/morpheus/gatk-4.2.2.0/gatk MarkDuplicates -I "$k".pp.x7.mtrm.bam -O "$k".pp.x7.mtdrm.bam -M "$k".pp.x7.mtdrm.txt -REMOVE_DUPLICATES True
/home/morpheus/radhika/samtools-1.14/samtools index -@ 32 "$k".pp.x7.mtdrm.bam
/home/morpheus/radhika/samtools-1.14/samtools flagstat "$k".pp.x7.mtdrm.bam
/home/morpheus/gatk-4.2.2.0/gatk CollectInsertSizeMetrics -I "$k".pp.x7.mtdrm.bam -O "$k".pp.x7.mtdrm.is_metrics.txt -H "$k".pp.x7.mtdrm.his.pdf -M 0.5
echo "$k" done
done
