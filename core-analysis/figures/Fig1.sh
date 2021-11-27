##Before Fig.R

#tes.nfr.x7.sh.d.txt from DESeq2
#GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.v1.rm.bed from RepeatModeler v4.1

#Getting the files ready for circlize
sed -e '1d' -e 's/"//g' -e 's/:/\t/' -e 's/-/\t/' tes.nfr.x7.sh.d.txt|awk -v OFS="\t" '{print $1,$2,$3}' > tes.nfr.x7.sh.des.bed
sed -e 's/NC_047627.1/chrX/g' -e 's/NC_047628.1/chr2L/g' -e 's/NC_047629.1/chr3/g' -e 's/NC_047630.1/chr4/g' -e 's/NC_047631.1/chr2R/g' -e 's/NW_022995738.1/u1/g' -e 's/NW_022995739.1/u2/g' -e 's/NW_022995740.1/u3/g' -e 's/NW_022995741.1/u4/g' -e 's/NW_022995742.1/u5/g' > tes.nfr.x7.sh.des.txt

#DAC for padj of 0.1
awk -v OFS="\t" '$9<=0.1 {print $1,$2,$3,$5,$9}' tes.nfr.x7.sh.des.txt > acc.tes.nfr.qv.txt
awk -v OFS="\t" '$4<0 {print}' acc.tes.nfr.qv.txt > do.qv.txt
awk -v OFS="\t" '$4>0 {print}' acc.tes.nfr.qv.txt > up.qv.txt

