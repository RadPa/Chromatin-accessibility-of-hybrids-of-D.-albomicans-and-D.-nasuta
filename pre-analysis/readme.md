# Pre-core analysis Requirements

# Quality checks
### FastQC
The raw reads quality were analyzed using **FastQC v0.11.9**

### Adaptor removal
The adaptor contamination of the reads were removed using **cutadapt v2.8**

### MultiQC
Log files of FastQC and cutadapt were analyzed using **MultiQC v1.9**

<img align="right" width="600" height="900" src="https://github.com/RadPa/ATAC-seq/blob/main/pre-analysis/Untitled%20presentation.svg">

# Alignment 
* Adaptor removed reads were aligned using **Bowtie v2.4.2**
* Post-processing of alignment was done using **SAMtools v1.11**
* Optical duplicates found in alignment was removed using **GATK4 MarkDuplicates v4.1.9.0**

# Blacklist

