#Dalbomicans
#single
mv ALB_JAP1_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > Single_"$i".bed
done
cat Single_*.bed > Single_blk.bed

#three
mv ALB_CHN3_M.rg.bam input 
mv ALB_TAI2_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > three_"$i".bed
done
cat three_*.bed > three_blk.bed

#five
mv ALB_CHN2_M.rg.bam input
mv ALB_IND1_M.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > five_"$i".bed
done
cat five_*.bed > five_blk.bed

#eight
mv ALB_TAI3_F.rg.bam input
mv ALB_JAP3_M.rg.bam input
mv ALB_IND2_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > eight_"$i".bed
done
cat eight_*.bed > eight_blk.bed

#nine
mv ALB_JAP2_M.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > nine_"$i".bed
done

cat nine_*.bed > nine_blk.bed

mv *.bed Dalb
mv input/*.bam .

#Dnasuta
#single
mv NAS_IND3_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > Single_"$i".bed
done
cat Single_*.bed > Single_blk.bed

#three
mv NAS_KEN3_F.rg.bam input
mv NAS_FRA3_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > three_"$i".bed
done
cat three_*.bed > three_blk.bed

#five
mv NAS_FRA1_F.rg.bam input
mv NAS_KEN1_F.rg.bam input 
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > five_"$i".bed
done
cat five_*.bed > five_blk.bed

#eight
mv NAS_KEN2_F.rg.bam input
mv NAS_IND1_F.rg.bam input
mv NAS_FRA2_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > eight_"$i".bed
done
cat eight_*.bed > eight_blk.bed

#nine
mv NAS_IND2_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > nine_"$i".bed
done
cat nine_*.bed > nine_blk.bed

mv *.bed dnas/
mv input/*.bam .

#BOTH
#single
mv ALB_JAP1_F.rg.bam input
mv NAS_IND3_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > both_Single_"$i".bed
done
cat both_Single_*.bed > both_Single_blk.bed

#three
mv ALB_CHN3_M.rg.bam input 
mv ALB_TAI2_F.rg.bam input
mv NAS_KEN3_F.rg.bam input
mv NAS_FRA3_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > both_three_"$i".bed
done
cat both_three_*.bed > both_three_blk.bed

#five
mv ALB_CHN2_M.rg.bam input
mv ALB_IND1_M.rg.bam input
mv NAS_FRA1_F.rg.bam input
mv NAS_KEN1_F.rg.bam input 
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > both_five_"$i".bed
done
cat both_five_*.bed > both_five_blk.bed

#eight
mv ALB_TAI3_F.rg.bam input
mv ALB_JAP3_M.rg.bam input
mv ALB_IND2_F.rg.bam input
mv NAS_KEN2_F.rg.bam input
mv NAS_IND1_F.rg.bam input
mv NAS_FRA2_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > both_eight_"$i".bed
done
cat both_eight_*.bed > both_eight_blk.bed

#nine
mv ALB_JAP2_M.rg.bam input
mv NAS_IND2_F.rg.bam input
for i in NC_047627.1 NC_047628.1 NC_047629.1 NC_047630.1 NC_047631.1 NW_022995738.1 NW_022995739.1 NW_022995740.1 NW_022995741.1 NW_022995742.1
do
~/atac/Blacklist/Blacklist "$i" > both_nine_"$i".bed
done
cat both_nine_*.bed > both_nine_blk.bed

mv *.bed both/
mv input/*.bam .

mkdir merged
cd merged
for i in Single three five eight nine
do 
cat ../dnas/"$i"_NC_047627.1.bed ../Dalb/"$i"_NC_047627.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NC_047627.1.bed
cat ../dnas/"$i"_NC_047628.1.bed ../Dalb/"$i"_NC_047628.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NC_047628.1.bed
cat ../dnas/"$i"_NC_047629.1.bed ../Dalb/"$i"_NC_047629.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NC_047629.1.bed
cat ../dnas/"$i"_NC_047630.1.bed ../Dalb/"$i"_NC_047630.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NC_047630.1.bed
cat ../dnas/"$i"_NC_047631.1.bed ../Dalb/"$i"_NC_047631.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NC_047631.1.bed
cat ../dnas/"$i"_NW_022995738.1.bed ../Dalb/"$i"_NW_022995738.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NW_022995738.1.bed
cat ../dnas/"$i"_NW_022995739.1.bed ../Dalb/"$i"_NW_022995739.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NW_022995739.1.bed
cat ../dnas/"$i"_NW_022995740.1.bed ../Dalb/"$i"_NW_022995740.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NW_022995740.1.bed
cat ../dnas/"$i"_NW_022995741.1.bed ../Dalb/"$i"_NW_022995741.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NW_022995741.1.bed
cat ../dnas/"$i"_NW_022995742.1.bed ../Dalb/"$i"_NW_022995742.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_NW_022995742.1.bed
cat ../dnas/"$i"_blk.bed ../Dalb/"$i"_blk.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > "$i"_blk.bed
done

for i in *.bed
do
mv $i merged_"$i"
done

cd ../dnas
for i in *.bed
do
mv $i dnas_"$i"
done

cd ../Dalb
for i in *.bed
do
mv $i dalb_"$i"
done

cd ../
cp Dalb/*.bed .
cp dnas/*.bed .
cp both/*.bed .
cp merged/*.bed .

for i in *_NC_047627.1.bed
do
y=`echo $i | sed 's/_NC_047627.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/33427555}'`
echo $y $mask $percent | sed 's/ /\t/g' >> ChrX_mask_percent.txt
done

for i in *_NC_047628.1.bed
do
y=`echo $i | sed 's/_NC_047628.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/30772581}'`
echo $y $mask $percent | sed 's/ /\t/g' >> Chr2l_mask_percent.txt
done

for i in *_NC_047629.1.bed
do
y=`echo $i | sed 's/_NC_047629.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/55557198}'`
echo $y $mask $percent | sed 's/ /\t/g' >> Chr3_mask_percent.txt
done

for i in *_NC_047630.1.bed
do
y=`echo $i | sed 's/_NC_047630.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/3955117}'`
echo $y $mask $percent | sed 's/ /\t/g' >> Chr4_mask_percent.txt
done

for i in *_NC_047631.1.bed
do
y=`echo $i | sed 's/_NC_047631.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/32236572}'`
echo $y $mask $percent | sed 's/ /\t/g' >> Chr2r_mask_percent.txt
done

for i in *_NW_022995738.1.bed
do
y=`echo $i | sed 's/_NW_022995738.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/1561104}'`
echo $y $mask $percent | sed 's/ /\t/g' >> un1_mask_percent.txt
done

for i in *_NW_022995739.1.bed
do
y=`echo $i | sed 's/_NW_022995739.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/5143694}'`
echo $y $mask $percent | sed 's/ /\t/g' >> un2_mask_percent.txt
done

for i in *_NW_022995740.1.bed
do
y=`echo $i | sed 's/_NW_022995740.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/668949}'`
echo $y $mask $percent | sed 's/ /\t/g' >> un3_mask_percent.txt
done

for i in *_NW_022995741.1.bed
do
y=`echo $i | sed 's/_NW_022995741.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/1184809}'`
echo $y $mask $percent | sed 's/ /\t/g' >> un4_mask_percent.txt
done

for i in *_NW_022995742.1.bed
do
y=`echo $i | sed 's/_NW_022995742.1.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/1322850}'`
echo $y $mask $percent | sed 's/ /\t/g' >> un5_mask_percent.txt
done

for i in *_blk.bed
do
y=`echo $i | sed 's/_blk.bed//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/165830429}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_mask_percent.txt
done


cat dalb_*_NC_047627.1.bed dnas_*_NC_047627.1.bed both_*_NC_047627.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > ChrX_all_merged.txt
cat dalb_*_NC_047628.1.bed dnas_*_NC_047628.1.bed both_*_NC_047628.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > Chr2l_all_merged.txt
cat dalb_*_NC_047629.1.bed dnas_*_NC_047629.1.bed both_*_NC_047629.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > Chr3_all_merged.txt
cat dalb_*_NC_047630.1.bed dnas_*_NC_047630.1.bed both_*_NC_047630.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > Chr4_all_merged.txt
cat dalb_*_NC_047631.1.bed dnas_*_NC_047631.1.bed both_*_NC_047631.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > Chr2r_all_merged.txt
cat dalb_*_NW_022995738.1.bed dnas_*_NW_022995738.1.bed both_*_NW_022995738.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > un1_all_merged.txt
cat dalb_*_NW_022995739.1.bed dnas_*_NW_022995739.1.bed both_*_NW_022995739.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > un2_all_merged.txt
cat dalb_*_NW_022995740.1.bed dnas_*_NW_022995740.1.bed both_*_NW_022995740.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > un3_all_merged.txt
cat dalb_*_NW_022995741.1.bed dnas_*_NW_022995741.1.bed both_*_NW_022995741.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > un4_all_merged.txt
cat dalb_*_NW_022995742.1.bed dnas_*_NW_022995742.1.bed both_*_NW_022995742.1.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > un5_all_merged.txt
cat dalb_*_blk.bed dnas_*_blk.bed both_*_blk.bed | sort -k1,1 -k2n,2 | bedtools merge -i - > all_all_merged.txt

i=ChrX_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/33427555}'`
echo $y $mask $percent | sed 's/ /\t/g' > all_merged.txt

i=Chr2l_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/30772581}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=Chr3_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/55557198}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=Chr4_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/3955117}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=Chr2r_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/32236572}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=un1_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/1561104}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=un2_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/5143694}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=un3_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/668949}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=un4_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/1184809}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=un5_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/1322850}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt

i=all_all_merged.txt
y=`echo $i | sed 's/_all_merged.txt//g'`
mask=`cat $i | awk '{print $3-$2}' | awk '{s+=$1}END{print s}'`
percent=`echo $mask | awk '{print $1/165830429}'`
echo $y $mask $percent | sed 's/ /\t/g' >> all_merged.txt
