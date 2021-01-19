##!/bin/bash
cd /home/radhika/atac
#Creating Bowtie index
# 3 minutes
/home/radhika/bowtie-1.3.0-linux-x86_64/bowtie-build Dalb/genome/genome.fa Dalb/genome/Umap_bowtie.ind

#Creating kmer 24, number of lanes in "chrsize_index.tsv" file created by bowtie build, seq number,172#
#Edit "chrsize_index.tsv" and remove the 0 index start the numbering from 1, first colum
#Time required as on 13th of Jan 2021 29m8.913s 30 minutes for get_kmers.py --kmer 
 
for i in `seq 1 172`
do 

#get_kmers.py
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py Dalb/chrsize.tsv Dalb/kmers/k24 Dalb/chrs Dalb/chrsize_index.tsv --job_id "$i" --kmer k24
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py Dalb/chrsize.tsv Dalb/kmers/k36 Dalb/chrs Dalb/chrsize_index.tsv --job_id "$i" --kmer k36
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py Dalb/chrsize.tsv Dalb/kmers/k50 Dalb/#chrs Dalb/chrsize_index.tsv --job_id "$i" --kmer k50
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/get_kmers.py Dalb/chrsize.tsv Dalb/kmers/k100 Dalb/chrs Dalb/chrsize_index.tsv --job_id "$i" --kmer k100

done

#Time required as on 13th of Jan 2021 12m36.150s 13 minutes run_bowtie.py
for i in `seq 1 171`
do

#run_bowtie.py
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py Dalb/kmers/k24 /home/radhika/bowtie-1.3.0-linux-x86_64 Dalb/genome Umap_bowtie.ind -job_id "$i"
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py Dalb/kmers/k36 /home/radhika/bowtie-1.3.0-linux-x86_64 Dalb/genome Umap_bowtie.ind -job_id "$i"
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py Dalb/kmers/k50 /home/radhika/bowtie-1.3.0-linux-x86_64 Dalb/genome Umap_bowtie.ind -job_id "$i"
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/run_bowtie.py Dalb/kmers/k100 /home/radhika/bowtie-1.3.0-linux-x86_64 Dalb/genome Umap_bowtie.ind -job_id "$i"

done

#Time required as on 13th of Jan 2021 1m50.077s 2 minutes unify_bowtie.py
for i in `seq 1 10`
do

#unify_bowtie.py
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py Dalb/kmers/k24 Dalb/chrsize.tsv -job_id "$i"
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py Dalb/kmers/k36 Dalb/chrsize.tsv -job_id "$i"
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py Dalb/kmers/k50 Dalb/chrsize.tsv -job_id "$i"
python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/unify_bowtie.py Dalb/kmers/k100 Dalb/chrsize.tsv -job_id "$i"

done
#Moving the files to TEMPs folder
mv Dalb/kmers/k24/*kmer* Dalb/kmers/k24/TEMPs
mv Dalb/kmers/k24/*bowtie* Dalb/kmers/k24/TEMPs
mv Dalb/kmers/k36/*kmer* Dalb/kmers/k36/TEMPs
mv Dalb/kmers/k36/*bowtie* Dalb/kmers/k36/TEMPs
mv Dalb/kmers/k50/*kmer* Dalb/kmers/k50/TEMPs
mv Dalb/kmers/k50/*bowtie* Dalb/kmers/k50/TEMPs
mv Dalb/kmers/k100/*kmer* Dalb/kmers/k100/TEMPs
mv Dalb/kmers/k100/*bowtie* Dalb/kmers/k100/TEMPs

#Creating kmer 36
#Time required as on 13th of Jan 2021 27m11.656s 28 minutes for --kmer k36 
#Time required as on 13th of Jan 2021 12m36.150s 13 minutes run_bowtie.py
#Creating kmer 50

for i in `seq 1 10`
do

python /home/radhika/py2-env/lib/python2.7/site-packages/umap-1.1.1-py2.7.egg/umap/combine_umaps.py Dalb/kmers Dalb/chrsize.tsv -job_id "$i"
done

for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
        
do
../Blacklist "$i" > "$i".bed
done
