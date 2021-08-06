## Generating Blacklist of the Genome

Blacklisting the regions of the genome is a **two step process**
  1. Create Mappability folder
  2. Input files (unfiltered bam)
  
## Mappability

Mappability folder for the genome was created using hoffmangroup/umap 
Uses python 2.7

python ubismap.py data/genome.fa data/chrsize.tsv data/TestGenomeMappability all.q $BOWTIEDIR/bowtie-build --kmer 8 12 -write_script test_run.sh

test_run.sh is the shell script created, that is modified according to the system environment
The bowtie-build will create kmers and needn't be set 

check the **blacklist.sh** for the script

## Blacklisting 
After mappability folder generation

git clone --recurse-submodules https://github.com/Boyle-Lab/Blacklist.git\
check the **blacklist.sh** for the script

./Blacklist chr1 > chr1.bed

After installation keep the input (unfiltered bam) and mappability folder in the same directory and the executable file Blacklist should be in the vicinity

Once the blacklist.bed was created for each chromosome, cat them and the Blacklist of the geome is ready
