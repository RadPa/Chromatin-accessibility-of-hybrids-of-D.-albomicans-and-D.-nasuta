#!/bin/bash\

#fastqc for re-sequencing data \
#fastqc for atac-seq data \

for i in `ls /home/hp1/radhika/atac/rawreads/*.gz` \
do
echo "$i"\
/home/hp1/radhika/FastQC/fastqc "$i" \
echo "$i" done\

done

#Multiqc uses python3.7\
source /home/hp1/radhika/py3-env/bin/activate \
multiqc -s -i pre-trim pre-trim_reads/\
