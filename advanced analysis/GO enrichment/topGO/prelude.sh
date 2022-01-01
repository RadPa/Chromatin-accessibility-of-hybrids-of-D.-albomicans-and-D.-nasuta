#Intersecting DACs of DESeq2 with genes only with formating
/home/hp1/radhika/bedtools2/bin/bedtools intersect -wb -a <(awk '$3=="gene"' ../data/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.sort.gff) -b <(cut -f 1-3 nfr.tes.des.q.bed) |awk -v OFS="\t" -F '["\t"";"]' ' {gsub(/ID=gene-/,"")} {print $15,$16,$17,$9}' > nfr.tes.des.int.bed 

#Intersect int bed with pvalues from DESeq2
/home/hp1/radhika/bedtools2/bin/bedtools intersect -wb -a nfr.tes.des.q.bed -b nfr.tes.des.int.bed|awk -v OFS="\t" '{print $1,$2,$3,$10,$4,$5,$6}' > nfr.tes.des.go.bed

#Manually removing the duplicates and kept only with higher degree of log2foldchange 
nfr.tes.des.gom.bed

#GO annotation from uniprot 
sed -ie '1d'  -e  's/\;/,/g' Dalb-GO.txt  
