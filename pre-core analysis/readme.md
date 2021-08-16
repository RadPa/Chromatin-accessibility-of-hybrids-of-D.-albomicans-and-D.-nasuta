# Quality Checks

## Read QC

<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/pre-core%20analysis/qc.png"> 

### FastQC

FastQC v0.11.9 and MultiQC v1.11 with python 3
The raw reads anlyzed by FastQC, adaptor removal tool, cutadapt used to remove the contamination.
Aggregation of QC report handled by MultiQC.

### Adapter Removal
Cutadapt v2.8 with python 3 was used for the analysis

## ATAC-seq QC

ATAC-seq specific QC can be performed only after the alignment of the reads to the genome.
Two of the ATAC-seq specific QC is used
  1. ATACseqQC
  2. ataqv                                   

### ATACseqQC

ATACseqQC is a Bioconductor R package (R v4.1). 

### ataqv

ataqv v1.2.1 was used.\
ataqv needs the peak files also, if TSS enrichment is desired.
