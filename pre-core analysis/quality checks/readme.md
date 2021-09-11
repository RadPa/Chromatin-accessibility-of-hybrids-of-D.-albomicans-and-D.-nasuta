# Quality check for the reads

## Read QC

<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/pre-core%20analysis/quality%20checks/qc.png"> 

### FastQC

The raw reads anlyzed by FastQC, adaptor removal tool, cutadapt used to remove the contamination.
Aggregation of QC report handled by MultiQC.

### Adapter Removal
Cutadapt used for adapter removal

## ATAC-seq QC

ATAC-seq specific QC can be performed only after the alignment of the reads to the genome.
Two of the ATAC-seq specific QC is used
  - ATACseqQC
  - ataqv                                   

### ATACseqQC

ATACseqQC, a Bioconductor R packaage, estimates the atac-seq library quality through fragment size distribution and many other ATAC-seq specific checks.

### ataqv

ataqv, a python package, estimates the atac-seq library quality through fragment length distribution and many other ATAC-seq specific checks

## FRiP score

FRiP score defined as the fraction of reads that fall into a peak, `samtools view` used for the mapped reads numbers and reads mapped to the peak regions found by following command

```
/home/radhika/bedtools2/bin/bedtools sort -i peakfile |/home/radhika/bedtools2/bin/bedtools merge -i stdin |/home/radhika/bedtools2/bin/bedtools intersect -u -nonamecheck -a shifted.bam -b stdin -ubam |/home/radhika/samtools-1.11/samtools view -c
```

|Sample|Mapped Reads|Peaks mapped|FRiP score|
|:---:|:---:|:---:|:---:|
|aat1|124952264|62105130|0.5|
|aat2|141861768|42695972|0.3|
|ant1|99356268|45042293|0.45|
|ant2|120777062|75125788|0.62|
