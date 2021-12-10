##Finding genes in DACs##
bedtools intersect -wb -a ../data/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.sort.gff -b nfr.tes.des.q.bed| awk '$3=="gene"'| awk -F";" '{print $1}' | awk -v OFS="\t" '{gsub(/ID=gene-/,"")} {print $1,$4,$5,$9}' > nfr.tes.des.q.int.bed

#If there are more than one gene in an DAC#
while read j
do
chr=`echo $j|awk '{print $1}'`
sta=`echo $j|awk '{print $2}'`
end=`echo $j|awk '{print $3}'`
gen=`grep "$chr" nfr.tes.des.q.int.bed |awk -v j=$end -v k=$sta '$2>=k && $3<=j{print $4}'|xargs|sed 's/ /,/g'`
echo -e "$chr\t$sta\t$end\t$gen" >> nfr.tes.des.q.genes
done < nfr.tes.des.q.bed

#For Gene names
cut -f 4 nfr.tes.des.q.int.bed|while read -r line
do
echo "$line"
efetch -db gene -id "$line" -format gene_table 
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
done

#For labelling of points
sed -e '1d' -e 's/"//g' -e 's/:/\t/' -e 's/-/\t/' nfr.tes.des.txt| awk -v OFS="\t" '{print $3-$2}' > nfr.tes.des.len.bed
