## Generating Blacklist of the Genome

Blacklisting the regions of the genome is a **two step process**
  1. Create Mappability folder
  2. Input files (aligned reads)
  
## Mappability

Mappability folder for the genome was created using hoffmangroup/umap \
Uses python 2.7
```
python ubismap.py data/genome.fa data/chrsize.tsv data/TestGenomeMappability all.q $BOWTIEDIR/bowtie-build --kmer 8 12 -write_script test_run.sh
```
test_run.sh script created, modified according to the system environment

The bowtie-build will create kmers and needn't be set 

check **blacklist.sh** 

## Blacklisting 
After mappability folder generation

```git clone --recurse-submodules https://github.com/Boyle-Lab/Blacklist.git``` 

check the **blacklist.sh** for the script

After installation, keep the input and mappability folder in the same path as executable Blacklist. We have generated blacklist using ATAC-seq data of _D. albomicans_ and _D. nasuta_.
