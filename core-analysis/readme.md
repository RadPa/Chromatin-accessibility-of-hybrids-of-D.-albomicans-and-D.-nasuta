<img align="right"  src="https://github.com/RadPa/ATAC-seq/blob/main/core-analysis/flowchart-core.png" width="400" height="400">

# Core-analysis

## Peak calling

The mitochondrial reads filtered from `shifted.bam` obtained from ATACseQC and `blacklist` of genome (*D. albomicans* and *D. nasuta*) were used to call peaks from HMMRATAC.

## Differential accessibility

The selected peaks from HMMRATAC were used in the differential peak analysis.

The folder contains the requirements for the two peak calling Bioconductor R packages. 
   
   - DESeq2
   - EdgeR
