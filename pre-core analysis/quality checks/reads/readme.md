# Raw reads QC

This is the first step in analysis of the data; the raw reads received from the sequencing service provider checked for the problems in the reads, before proceeding further.

## Number of bases in fastq
```
zcat fastq.gz | paste - - - - |cut -f 2 | tr -d '\n' | wc -c
```

## FastQC
The raw reads analyzed through ```FastQC v0.11.9``` for forward and reverse reads

## Cutadapt
The FastQC found adaptor contamination in the raw reads and removed by pyhon3 package ```Cutadapt v2.8```

## MultiQC
An aggregate report generator ```MultiQC v1.11```,pyhon3 package for a consolidated report of FastQC 

## Contents
This folder contains the script for the qc analysis **qc.sh**, **fastqc** and **multiqc reports** of the ATAC-seq data.
