#!/bin/bash\

#fastqc for re-sequencing data \
#fastqc for atac-seq data \
for i in `ls *.gz` \
do
echo "$i"\
/home/hp1/radhika/FastQC/fastqc "$i" \
echo "$i" done\

done
