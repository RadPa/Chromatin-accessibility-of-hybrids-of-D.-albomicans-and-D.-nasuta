# Pre-core analysis Requirements

<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/pre-analysis/flowChart.png"> 

# Quality checks
### FastQC
The raw reads quality were analyzed using **FastQC v0.11.9**

### Adaptor removal
The adaptor contamination of the reads were removed using **cutadapt v2.8**

### MultiQC
Log files of FastQC and cutadapt were analyzed using **MultiQC v1.9**

### FRiP scores
Calculated scores are present in **frip.md**

# Alignment 
* Adaptor removed reads were aligned using **Bowtie v2.4.2**
* Post-processing of alignment was done using **SAMtools v1.11**
* Optical duplicates found in alignment was removed using **GATK4 MarkDuplicates v4.1.9.0**

# Blacklist
Amemiya et al (2019), stated that there are regions in genomes that have anomalous, unstructured, or high signal in NGS experiments and removal of such regions is an essential quality measure when analyzing functional genomics data. 
Blacklist was created for the organism of interest using Blacklist:https://github.com/Boyle-Lab/Blacklist
