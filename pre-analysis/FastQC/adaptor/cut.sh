#cutadapt 2.8 with Python 3.8.5 \

#!/bin/bash \

#Trimming for batch2 data Illumina Trueseq lib kit\
source /home/hp1/radhika/py3-env/bin/activate\

for i in `ls *_1.fastq.gz`\
do\


j=`echo "$i"|sed 's/_1.fastq.gz/_2.fastq.gz/'`\
k=`echo "$i"|sed 's/_1.fastq.gz/_ct_1.fastq.gz/'`\
l=`echo "$j"|sed 's/_2.fastq.gz/_ct_2.fastq.gz/'`\
m=`echo "$i"|sed 's/_1.fastq.gz//'`\

echo "$m" started \
#Nextera adapter sequences for ATAC-seq\
cutadapt -a CTGTCTCTTATACACATCT -A CTGTCTCTTATACACATCT -j 16 -o "$k" -p "$l" "$i" "$j"\
echo "$m" done\
done\
