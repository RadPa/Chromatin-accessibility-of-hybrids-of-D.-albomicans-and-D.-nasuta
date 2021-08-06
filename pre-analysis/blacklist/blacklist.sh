##!/bin/bash
cd /home/radhika/atac\
#Workstation Z840\
######Blacklisting######\
####Mappability folder design####\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/ubismap.py /home/radhika/atac/tff/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna /home/radhika/atac/peaks/testes/alb-chr.size /home/radhika/atac/blist alb /home/radhika/bowtie-1.3.0-linux-x86_64/bowtie-build -write_script blist.sh 
#Creates a blist.sh script, and was modified to work as following

#Creating Bowtie index\
# 3 minutes\
##umap python 2.7##
/home/radhika/bowtie-1.3.0-linux-x86_64/bowtie-build /home/radhika/atac/blist/genome/genome.fa /home/radhika/atac/blist/genome/Umap_bowtie.ind\

#Creating kmer 24, number of lanes in "chrsize_index.tsv" file created by bowtie build, seq number,172#\
#Edit "chrsize_index.tsv" and remove the 0 index start the numbering from 1, first colum\
#Time required as on 13th of Jan 2021 29m8.913s 30 minutes for get_kmers.py --kmer \
 
for i in `seq 1 172`\
do \

#get_kmers.py\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py /home/radhika/atac/blist/chrsize.tsv /home/radhika/atac/blist/kmers/k24 /home/radhika/atac/blist/chrs /home/radhika/atac/blist/chrsize_index.tsv --job_id "$i" --kmer k24\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py /home/radhika/atac/blist/chrsize.tsv /home/radhika/atac/blist/kmers/k36 /home/radhika/atac/blist/chrs /home/radhika/atac/blist/chrsize_index.tsv --job_id "$i" --kmer k36\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py /home/radhika/atac/blist/chrsize.tsv /home/radhika/atac/blist/kmers/k50 /home/radhika/atac/blist/chrs /home/radhika/atac/blist/chrsize_index.tsv --job_id "$i" --kmer k50\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py /home/radhika/atac/blist/chrsize.tsv /home/radhika/atac/blist/kmers/k100 /home/radhika/atac/blist/chrs /home/radhika/atac/blist/chrsize_index.tsv --job_id "$i" --kmer k100\

done\

#Time required as on 13th of Jan 2021 12m36.150s 13 minutes run_bowtie.py\
for i in `seq 1 171`\
do\

#run_bowtie.py\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py /home/radhika/atac/blist/kmers/k24 /home/radhika/bowtie-1.3.0-linux-x86_64 /home/radhika/atac/blist/genome Umap_bowtie.ind -job_id "$i"\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py /home/radhika/atac/blist/kmers/k36 /home/radhika/bowtie-1.3.0-linux-x86_64 /home/radhika/atac/blist/genome Umap_bowtie.ind -job_id "$i"\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py /home/radhika/atac/blist/kmers/k50 /home/radhika/bowtie-1.3.0-linux-x86_64 /home/radhika/atac/blist/genome Umap_bowtie.ind -job_id "$i"\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py /home/radhika/atac/blist/kmers/k100 /home/radhika/bowtie-1.3.0-linux-x86_64 /home/radhika/atac/blist/genome Umap_bowtie.ind -job_id "$i"\
done\

#Time required as on 13th of Jan 2021 1m50.077s 2 minutes unify_bowtie.py\
for i in `seq 1 10`\
do\

#unify_bowtie.py
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py /home/radhika/atac/blist/kmers/k24 /home/radhika/atac/blist/chrsize.tsv -job_id "$i"\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py /home/radhika/atac/blist/kmers/k36 /home/radhika/atac/blist/chrsize.tsv -job_id "$i"\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py /home/radhika/atac/blist/kmers/k50 /home/radhika/atac/blist/chrsize.tsv -job_id "$i"\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py /home/radhika/atac/blist/kmers/k100 /home/radhika/atac/blist/chrsize.tsv -job_id "$i"\

done\
#Moving the files to TEMPs folder\
mv /home/radhika/atac/blist/kmers/k24/*kmer* /home/radhika/atac/blist/kmers/k24/TEMPs\
mv /home/radhika/atac/blist/kmers/k24/*bowtie* /home/radhika/atac/blist/kmers/k24/TEMPs\
mv /home/radhika/atac/blist/kmers/k36/*kmer* /home/radhika/atac/blist/kmers/k36/TEMPs\
mv /home/radhika/atac/blist/kmers/k36/*bowtie* /home/radhika/atac/blist/kmers/k36/TEMPs\
mv /home/radhika/atac/blist/kmers/k50/*kmer* /home/radhika/atac/blist/kmers/k50/TEMPs\
mv /home/radhika/atac/blist/kmers/k50/*bowtie* /home/radhika/atac/blist/kmers/k50/TEMPs\
mv /home/radhika/atac/blist/kmers/k100/*kmer* /home/radhika/atac/blist/kmers/k100/TEMPs\
mv /home/radhika/atac/blist/kmers/k100/*bowtie* /home/radhika/atac/blist/kmers/k100/TEMPs\

#Unifying all the kmers#
for i in `seq 1 10`\
do\
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/combine_umaps.py /home/radhika/atac/blist/kmers /home/radhika/atac/blist/chrsize.tsv -job_id "$i"\
done\

####Calling Blacklist regions of the genome####
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1\    
do\
../Blacklist "$i" > "$i".bed\
done\

#Concatenating bed for Blacklisting the region of geome\
cat NC_047627.1.bed NC_047628.1.bed NC_047629.1.bed NC_047630.1.bed NC_047631.1.bed NW_022995738.1.bed NW_022995739.1.bed NW_022995740.1.bed NW_022995741.1.bed NW_022995742.1.bed > Blacklist.bed
