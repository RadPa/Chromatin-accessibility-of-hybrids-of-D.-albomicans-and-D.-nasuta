##Figure 3##
#Figure 3A
#Readying for volcano plots for TF motifs across 
sed '1d' j22_results.txt|cut -f 2,10,11 > vol.aj22.txt
#Calculating adj-pvalue by multiplying with number of rows, here 150 TFs
sed '1d' jp22_results.txt| awk -v OFS="\t" '{print $2,$10,$11,$11*150}' > jp22_vol.txt

#Figure 3B
#Pheatmap individual scores
#BINDdetect for individual species
TOBIAS BINDetect --signals AAT_footprints.bw --peaks "$PEAK" --motifs "$JAS22" --genome "$FA" --cond-names alb --prefix alb_j22 --outdir alb_aj22 --cores 16
TOBIAS BINDetect --signals ANT_footprints.bw --peaks "$PEAK" --motifs "$JAS22" --genome "$FA" --cond-names nas --prefix nas_j22 --outdir nas_aj22 --cores 16
sed '1d' alb_aj22_results.txt|cut -f 2,6 > alb.ind.txt
sed '1d' nas_aj22_results.txt|cut -f 2,6 > nas.ind.txt
paste alb.ind.txt nas.ind.txt|cut -f 1,2,4 > ind.score.txt
