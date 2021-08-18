# Raw reads QC

This is the first step in analysis of the data; the raw reads received from the sequencing service provider checked for the problems in the reads, before proceeding further.

## FastQC
The raw reads analyzed through ```FastQC v0.11.9``` for forward and reverse reads

### Cutadapt
The FastQC found adaptor contamination in the raw reads and removed by pyhon3 package ```Cutadapt v2.8```

### MultiQC
The FastQC results were aggregated as a single result by pyhon3 package ```MultiQC v1.11```
