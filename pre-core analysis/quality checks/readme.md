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

ATACseqQC, a Bioconductor R packaage, estimates the atac-seq library quality through fragment size distribution and many other ATAC-seq specific checks.

### ataqv

ataqv, a python package, estimates the atac-seq library quality through fragment length distribution and many other ATAC-seq specific checks.
