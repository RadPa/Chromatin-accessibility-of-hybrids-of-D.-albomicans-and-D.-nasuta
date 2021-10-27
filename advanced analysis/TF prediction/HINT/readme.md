# RGT-HINT

## Input Files
1. Merged reads
2. Peaks \
        a. all peaks \
        b. peaks of pvalue 0.01\
        c. peaks of qvalue 0.1
3. Motifs from RGT

### Peaks
```
awk -v OFS="\t" '{print $1}' tes.nfr.x7.sh.d.txt |sed -e '1d' -e 's/"//g' -e 's/:/\t/g' -e 's/-/\t/' > dac.tes.x7.peak.bed
awk -v OFS="\t" '$7<=0.1{print $1}' tes.nfr.x7.sh.d.txt|sed -e '1d' -e 's/"//g' -e 's/:/\t/g' -e 's/-/\t/' > dac.tes.x7.peak.qv.bed
awk -v OFS="\t" '$6<=0.01{print $1}' tes.nfr.x7.sh.d.txt|sed -e '1d' -e 's/"//g' -e 's/:/\t/g' -e 's/-/\t/' > dac.tes.x7.peak.pv.bed
```
