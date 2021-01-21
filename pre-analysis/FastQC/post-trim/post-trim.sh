#!/bin/bash

#fastqc for adapter removed atac-seq data\
for i in `ls *trimmed.gz` \
do\
echo "$i"\
/home/hp1/radhika/FastQC/fastqc "$i" \
echo "$i" done\

done

#Multiqc uses python3.7 \
multiqc -s -f -m fastqc -m cutadapt -i post-trim post-trim_reads/ \
