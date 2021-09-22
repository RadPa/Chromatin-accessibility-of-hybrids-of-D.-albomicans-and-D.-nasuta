# Differential accessibility 
The differential accessibility across two species carried out using two R packages
- DESeq2
- edgeR

## DESeq2
DESeq2 is a method for differential analysis with replicates, depending on the raw count of `.bam` reads based on a model using the negative binomial distribution. The package is available at **Bioconductor**.

## edgeR
edgeR is a method for differential analysis with replication, depending on the raw count of `.bam` reads based on the negative binomial distributions, including empirical Bayes estimation, exact tests, generalized linear models and quasi-likelihood tests. The package is available at **Bioconductor**. 

### Requirments
1. Raw count files
 - Peaks merged into bed

```
cat aat1.gappedPeak aat2.gappedPeak ant1.gappedPeak ant2.gappedPeak | awk -v OFS="\t" '$13>=10 {print $1,$7,$8}' | sort -k1,1 -k2,2n |/home/radhika/bedtools2/bin/bedtools merge -i stdin > tes.sh.nfr.mbed
```
  - Bam coverage for merged bed
```
/home/radhika/bedtools2/bin/bedtools multicov -D -bams aat1.shm.bam aat2.shm.bam ant1.shm.bam ant2.shm.bam -bed tes.sh.nfr.mbed > tes.sh.nfr.count
```
 - Filtering regions not supported by minimum of 10 bam reads
```
awk '$4>=10 && $5>=10 && $6>=10 && $7>=10 {print}' tes.sh.nfr.count > tmp && mv tmp tes.sh.nfr.count
```
2. Metadata file `info.txt`

### Contents
1. Raw count files
2. Metadata
3. Folders of DESeq2 and edgeR
