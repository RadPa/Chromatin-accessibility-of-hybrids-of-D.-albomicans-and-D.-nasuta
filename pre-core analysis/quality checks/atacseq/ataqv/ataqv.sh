#!/bin/bash
#ataqv 1.2.1
for i in `ls *.sdup.bam`
do

j=`echo "$i" | sed 's/\.sdup.bam/\.gappedPeak/g'`
k=`echo "$i" | sed 's/\.sdup.bam//g'`

UTR=/home/hp1/radhika/atac/data/dalb.utr-tss.bed
TSS=/home/hp1/radhika/atac/data/dalb.txs-tss.bed

echo "$i"
echo "$j"
/home/hp1/radhika/ataqv/ataqv --peak-file "$j" --tss-file "$UTR" --metrics-file "$k".utr.json.gz --autosomal-reference-file /home/hp1/radhika/atac/data/alb-chr.size --mitochondrial-reference-name NC_027937.1 albomicans "$i"
/home/hp1/radhika/ataqv/ataqv --peak-file "$j" --tss-file "$TSS" --metrics-file "$k".tss.json.gz --autosomal-reference-file /home/hp1/radhika/atac/data/alb-chr.size --mitochondrial-reference-name NC_027937.1 albomicans "$i"
echo "$k" done
done

echo visuals
/home/hp1/radhika/ataqv/src/scripts/mkarv --force -p "calculate" -r "calculate" atac.utr AAT1.utr.json.gz AAT2.utr.json.gz ANT1.utr.json.gz ANT2.utr.json.gz
/home/hp1/radhika/ataqv/src/scripts/mkarv --force -p "calculate" -r "calculate" atac.tss AAT1.tss.json.gz AAT2.tss.json.gz ANT1.tss.json.gz ANT2.tss.json.gz

echo done
