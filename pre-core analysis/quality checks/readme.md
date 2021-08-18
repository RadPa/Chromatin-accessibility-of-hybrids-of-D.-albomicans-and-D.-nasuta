# Quality check for the reads

## Read QC

<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/pre-analysis/FastQC/qc.png"> 

### FastQC

The raw reads anlyzed by FastQC, adaptor removal tool, cutadapt used to remove the contamination.
Aggregation of QC report handled by MultiQC.

### Adapter Removal
Cutadapt used for adapter removal

## ATAC-seq QC

ATAC-seq specific QC can be performed only after the alignment of the reads to the genome.
Two of the ATAC-seq specific QC is used
  1. ATACseqQC
  2. ataqv                                   

### ATACseqQC

ATACseqQC is a Bioconductor R packaage 

### ataqv

ataqv is a python package
