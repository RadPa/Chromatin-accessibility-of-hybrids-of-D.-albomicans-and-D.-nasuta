#!/bin/bash
#Z840 workstation\
cd /home/radhika/atac/par\

#### Bowtie version 2.4.2 ####\
##  Genome indexing ##\
#/home/radhika/bowtie2-2.4.2-sra-linux-x86_64/bowtie2-build --threads 16 -f GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna \
#30.64hrs on 10.01.21\
for i in `ls *_1.fastq.gz`\
do 

j=`echo "$i" | sed 's/_1/_2/g'` \

k=`echo "$i" | sed 's/_1.fastq.gz//g'` \

echo mapping "$k"\
##Mapping and format conversions##\

/home/radhika/bowtie2-2.4.2-sra-linux-x86_64/bowtie2 -p 32 --very-sensitive -X 1000 --seed 21 -x GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna -1 "$i" -2 "$j" | /home/radhika/samtools-1.11/samtools view -b -o "$k".bam\
/home/radhika/samtools-1.11/samtools sort "$k".bam -o "$k".sbam #Don't ever pipe the sort if the .bam files are not made, logical\

#/home/radhika/samtools-1.11/samtools view -b "$k".sam |/home/radhika/samtools-1.11/samtools sort -o "$k".sbam\

echo samtools "$k"\
##Statistics## \
/home/radhika/samtools-1.11/samtools index "$k".sbam\
/home/radhika/samtools-1.11/samtools flagstat "$k".sbam > "$k".sbam.stat \

echo removing mito and filtering reads\
##Filtering .bam##

#Removing mitochondrial reads, albomicans mitochondria NC_027937.1 and filtering for properly paired reads#\
/home/radhika/samtools-1.11/samtools idxstats "$k".sbam| cut -f 1 | grep -v NC_027937.1 | xargs /home/radhika/samtools-1.11/samtools view -b -f 3 "$k".sbam|/home/radhika/samtools-1.11/samtools sort -o "$k".ft.bam \
/home/radhika/samtools-1.11/samtools index "$k".ft.bam\

echo removing duplicates\
##removing duplicates-picardtools## \
/home/radhika/gatk-4.1.9.0/./gatk MarkDuplicates -I "$k".ft.bam -O "$k".ftd.bam -M "$k".dupmatr.txt -REMOVE_DUPLICATES true \
/home/radhika/samtools-1.11/samtools sort "$k".ftd.bam -o "$k".filtered.bam\
/home/radhika/samtools-1.11/samtools index "$k".filtered.bam\
/home/radhika/samtools-1.11/samtools flagstat "$k".filtered.bam > "$k".filtered.stat\

##fragment length distribution##  \
echo picard "$k"\
/home/radhika/gatk-4.1.9.0/./gatk CollectInsertSizeMetrics -I "$k".filtered.bam -O "$k".is_metrics.txt -H "$k".is_histogram.pdf -M 0.5 \

echo "$k" done\
done

done
