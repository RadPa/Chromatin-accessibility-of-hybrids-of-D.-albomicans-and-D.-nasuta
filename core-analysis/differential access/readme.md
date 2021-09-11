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
```
cat AAT1.gappedPeak AAT2.gappedPeak ANT1.gappedPeak ANT2.gappedPeak | awk -v OFS="\t" '$13>=10 {print $1,$7,$8}' | sort -k1,1 -k2,2n |/home/radhika/bedtools2/bin/bedtools merge -i stdin > tes.nfrm.bed 
/home/radhika/bedtools2/bin/bedtools multicov -D -bams AAT1.filtered.bam AAT2.filtered.bam ANT1.filtered.bam ANT2.filtered.bam -bed tes.q2.f1.nfr.mbed > tes.nfr.count 
```
2. Metadata file `info.txt`

### Contents
1. Raw count files
2. Metadata
3. Folders of DESeq2 and edgeR
