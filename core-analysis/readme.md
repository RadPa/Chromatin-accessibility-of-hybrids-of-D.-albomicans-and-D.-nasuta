# Core-analysis

## Peak calling

The mitochondrial reads filtered from `shifted.bam` obtained from ATACseQC and `blacklist` of genome (*D. albomicans* and *D. nasuta*) were used to call peaks from HMMRATAC.

## Differential access

The selected peaks from HMMRATAC were used in the differential peak analysis.

The folder contains the requirements for the two peak calling Bioconductor R packages. 
   
   - DESeq2
   - EdgeR
## Required files
The annotation files were enhanced and sorted `AGAT` using `gff3sort` respectively.
```
agat_convert_sp_gxf2gxf.pl -g atac/data/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.gff -o atac/data/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.gff 
gff3sort.pl GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.gff > GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.sort.gff  
```
