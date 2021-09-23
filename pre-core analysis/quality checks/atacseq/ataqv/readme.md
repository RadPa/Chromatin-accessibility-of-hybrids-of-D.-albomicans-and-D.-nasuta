## ataqv
`ataqv v1.2.1` a computational toolkit for efficiently measuring, visualizing, and comparing quality control (QC) results across samples and experiments, 

### Requirements for the analysis

1. genome size
2. shifted bams
3. peak files
4. TSS files for TSS enrichment scores

```
awk -v OFS="\t" '$3=="five_prime_UTR" {print}' GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.sort.gff|awk -v OFS="\t" -F";" '{print $1,$2}'| cut -f 1,4,5,7 > dalb.utr-tss.bed 
```

### Contents
1. genome size in **.bed** format
2. peak files in **.gappedPeak** format
3. TSS in **.bed** format, transcript_id and 5' UTRs
4. Result in **.png** format
