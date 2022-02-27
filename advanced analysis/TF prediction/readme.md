# Transcription Factor Binding Sites Prediction
TFBS prediction using **TOBIAS**

## TOBIAS 
Requirements
1. Annotated Peaks
2. Blacklist
3. Genome fasta
4. JASPAR2022 Insecta
5. Merged Peaks

### Annotation of peaks
```
uropa -b tes.nfr.sh.mbed -g ../../info-g/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.sort.gtf --show_attributes GeneID Name --feature_anchor start --distance 2000 1000 --feature gene -p tes.nfr.sh.ann
```

### JASPAR invertebrate pfms 
https://jaspar.genereg.net/download/data/2022/CORE/JASPAR2022_CORE_insects_non-redundant_pfms_jaspar.txt

### Merged reads
Replicates were merged
```
/home/radhika/samtools-1.13/samtools merge AAT.mer.bam AAT1.mtrdm.bam AAT2.mtrdm.bam
/home/radhika/samtools-1.13/samtools merge ANT.mer.bam ANT1.mtrdm.bam ANT2.mtrdm.bam
/home/radhika/samtools-1.13/samtools index AAT.mer.bam
/home/radhika/samtools-1.13/samtools index ANT.mer.bam
```

### Merged peaks
``` 
awk -v OFS="\t" '{print $1}' tes.nfr.sh.txt |sed -e '1d' -e 's/"//g' -e 's/:/\t/g' -e 's/-/\t/' > tes.nfr.sh.mbed
```

## Network
Cytoscape 
