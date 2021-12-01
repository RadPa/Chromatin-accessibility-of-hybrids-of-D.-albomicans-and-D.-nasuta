# Pre-core analysis Requirements

<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/pre-core%20analysis/flowChart.png" width="400" height="400"> 

# Quality checks
### FastQC
The raw reads quality were analyzed using FastQC

### Adaptor removal
The adaptor contamination of the reads were removed using cutadapt

### MultiQC
Log files of FastQC and cutadapt were analyzed using MultiQC

# Alignment 
* Adaptor removed reads were aligned using Bowtie 
* Post-processing of alignment was done using SAMtools
* Optical duplicates found in alignment was removed using GATK4 MarkDuplicates

# Blacklist
Regions in genomes that have anomalous, unstructured, or high signal in NGS experiments and removal of such regions is an essential quality measure when analyzing functional genomics data (Amemiya et al 2019). 
