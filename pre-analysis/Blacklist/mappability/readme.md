The Blacklist of the genome is a two step process
  1. Create Mappability folder
  2. Input files (unfiltered bam)

The Mappability folder for the genome was created using hoffmangroup/umap \
cd umap\
python ubismap.py -h\

#The bowtie-build will create the kmers and needn't be set \
python ubismap.py data/genome.fa data/chrsize.tsv data/TestGenomeMappability all.q $BOWTIEDIR/bowtie-build --kmer 8 12 -write_script test_run.sh\
test_run.sh is the shell script created, that is modified according to the system environment, \
check the blacklist.sh for working script\

After mappability folder creation\
Blacklist called\
git clone --recurse-submodules https://github.com/Boyle-Lab/Blacklist.git\
./Blacklist chr1 > chr1.bed\

After installation keep the input (unfiltered bam) and mappability folder in a same directory and call the Blacklist\
Check the Blacklist.sh\
Once the blacklist.bed was created for each chromosome, cat them and the Blacklist of the geome is ready\
