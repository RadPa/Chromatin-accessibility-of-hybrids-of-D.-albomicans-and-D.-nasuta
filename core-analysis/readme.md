# Core-analysis

<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/core-analysis/flowchart-core.png" width="400" height="300">

## Peak calling

The mitochondrial reads filtered from `shifted.bam` obtained from ATACseQC and `blacklist` of genome (*D. albomicans* and *D. nasuta*) were used to call peaks from HMMRATAC.

## FRiP scores
FRiP score defined as the fraction of reads that fall into a peak.

(a) nucleosome-free regions from gaapedPeaks
```
awk -v OFS="\t" '$13>=10 {print $1,$7,$8}' gappedPeak > peaks
```
(b) reads of shifted.bam
```
samtools view -c
``` 
(c) mapping peaks onto the shiftedbam

```
/home/radhika/bedtools2/bin/bedtools sort -i peakfile |/home/radhika/bedtools2/bin/bedtools merge -i stdin |/home/radhika/bedtools2/bin/bedtools intersect -u -nonamecheck -a shifted.bam -b stdin -ubam |/home/radhika/samtools-1.11/samtools view -c
```

|Sample|shiftedReads|mappedPeaks|NPeaks|FRiP score|
|:---:|:---:|:---:|:---:|:---:|
|aat1|68498298|3698568|8283|0.|
|aat2|42713726||13471|0.|
|ant1|40219964||43157|0.|
|ant2|||15248|0.|

## Differential accessibility

The selected peaks from HMMRATAC were used in the differential peak analysis.
 
   - DESeq2
   - edgeR

### Content
The folder contains the requirements for the two peak calling Bioconductor R packages. 
