awk '$3=="gene" {print $1,$4,$5,$9}' nfr.tes.des.int.bed|awk -F ';' '{print $1}'|sed 's/ID=gene-//'|awk -v OFS="\t" '{print $4,$1,$2,$3}'>nfr.tes.des.g.bed 

awk 'NR==FNR {end[$4]; next} ($3 in end)' nfr.tes.des.g.bed nfr.tes.des.txt > nfr.tes.des.go.txt 

cut -f 1 nfr.tes.des.g.bed > genes 

paste genes.txt nfr.tes.des.go.txt > nfr.tes.des.go 

cut -f 1,5-10 nfr.tes.des.go > nfr.tes.des.go.r.txt 

#GO annotation from uniprot 

sed -ie '1d'  -e  's/\;/,/g' Dalb-GO.txt  

mv nfr.tes.des.go.r.txt nfr.tes.des.genelist 
