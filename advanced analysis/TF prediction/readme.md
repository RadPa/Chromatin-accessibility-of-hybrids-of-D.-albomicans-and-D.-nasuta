# Transcription Factor Binding Sites Prediction
TFBS prediction using **TOBIAS**

## TOBIAS 
Requirements
1. Annotated Peaks
2. Blacklist
3. Genome fasta
4. JASPAR2022 Insecta
5. Merged Peaks

### Merged reads
Replicates were merged
```
/home/radhika/samtools-1.13/samtools merge AAT.x7.mer.bam AAT1.x7.mtrdm.bam AAT2.x7.mtrdm.bam
/home/radhika/samtools-1.13/samtools merge ANT.x7.mer.bam ANT1.x7.mtrdm.bam ANT2.x7.mtrdm.bam
/home/radhika/samtools-1.13/samtools index AAT.x7.mer.bam
/home/radhika/samtools-1.13/samtools index ANT.x7.mer.bam
```

### Merged peaks
``` 
awk -v OFS="\t" '{print $1}' tes.nfr.x7.sh.d.txt |sed -e '1d' -e 's/"//g' -e 's/:/\t/g' -e 's/-/\t/' > dac.tes.x7.peak.bed
```

### JASPAR invertebrate pfms 
https://jaspar.genereg.net/download/data/2022/CORE/JASPAR2022_CORE_insects_non-redundant_pfms_jaspar.txt

### Network
Cytoscape 
