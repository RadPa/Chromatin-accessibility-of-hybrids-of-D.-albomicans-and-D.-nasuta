#!/bin/bash

####TF prediction using HINT-ATAC RGT####
source /home/radhika/py3-env/bin/activate
mv /home/radhika/atac/tff/*.mers.* . 

for i in `ls *.mers.bam`
do 
j=`echo "$i"|sed 's/\.mers.bam//g'`
MP=/home/radhika/atac/tff/peaks.mnfr.bed
DQ=/home/radhika/atac/tff/nfr.des.qsig.bed
DP=/home/radhika/atac/tff/nfr.des.psig.bed
JI=/home/radhika/rgtdata/motifs/jaspar_insects
JR=/home/radhika/rgtdata/motifs/jaspar-rad-insect
ATB=/home/radhika/atac/tff/rgt/AAT.mers.bam
ANT=/home/radhika/atac/tff/rgt/ANT.mers.bam

echo "$i" 

echo footprinting "$j"
rgt-hint footprinting "$i" "$MP" --atac-seq --paired-end --organism dalb --output-location /home/radhika/atac/tff/rgt --output-prefix="$j".mp
rgt-hint footprinting "$i" "$DP" --atac-seq --paired-end --organism dalb --output-location /home/radhika/atac/tff/rgt --output-prefix="$j".pd
rgt-hint footprinting "$i" "$DQ" --atac-seq --paired-end --organism dalb --output-location /home/radhika/atac/tff/rgt --output-prefix="$j".qd

echo tracks "$j" 
rgt-hint tracks --organism dalb --bc --norm --bigWig --strand-specific --output-location /home/radhika/atac/tff/rgt --output-prefix="$j".mp "$i" "$MP"
rgt-hint tracks --organism dalb --bc --norm --bigWig --strand-specific --output-location /home/radhika/atac/tff/rgt --output-prefix="$j".pd "$i" "$DP"
rgt-hint tracks --organism dalb --bc --norm --bigWig --strand-specific --output-location /home/radhika/atac/tff/rgt --output-prefix="$j".qd "$i" "$DQ"

done

echo motif matching
rgt-motifanalysis matching --motif-db "$JI" --organism dalb --input-files AAT.mp.bed ANT.mp.bed --output-location mp
rgt-motifanalysis matching --motif-db "$JI" --organism dalb --input-files AAT.pd.bed ANT.pd.bed --output-location pd
rgt-motifanalysis matching --motif-db "$JI" --organism dalb --input-files AAT.qd.bed ANT.qd.bed --output-location qd

rgt-motifanalysis matching --motif-db "$JR" --organism dalb --input-files AAT.mp.bed ANT.mp.bed --output-location rmp
rgt-motifanalysis matching --motif-db "$JR" --organism dalb --input-files AAT.pd.bed ANT.pd.bed --output-location rpd
rgt-motifanalysis matching --motif-db "$JR" --organism dalb --input-files AAT.qd.bed ANT.qd.bed --output-location rqd
#Time require 152m #

echo differential

cd mp/
rgt-hint differential --organism dalb --mpbs-files AAT.mp_mpbs.bed,ANT.mp_mpbs.bed --reads-files "$ATB","$ANT" --conditions alb,nas --nc 16 --output-prefix=dfmp
cd ../pd
rgt-hint differential --organism dalb --mpbs-files AAT.pd_mpbs.bed,ANT.pd_mpbs.bed --reads-files "$ATB","$ANT" --conditions alb,nas --nc 16 --output-prefix=dfpd 
cd ../qd
rgt-hint differential --organism dalb --mpbs-files AAT.qd_mpbs.bed,ANT.qd_mpbs.bed --reads-files "$ATB","$ANT" --conditions alb,nas --nc 16 --output-prefix=dfqd 
cd ../rmp
rgt-hint differential --organism dalb --mpbs-files AAT.mp_mpbs.bed,ANT.mp_mpbs.bed --reads-files "$ATB","$ANT" --conditions alb,nas --nc 16 --output-prefix=dfrmp 
cd ../rpd
rgt-hint differential --organism dalb --mpbs-files AAT.pd_mpbs.bed,ANT.pd_mpbs.bed --reads-files "$ATB","$ANT" --conditions alb,nas --nc 16 --output-prefix=dfrpd 
cd ../rqd
rgt-hint differential --organism dalb --mpbs-files AAT.qd_mpbs.bed,ANT.qd_mpbs.bed --reads-files "$ATB","$ANT" --conditions alb,nas --nc 16 --output-prefix=dfrqd 

echo HINT done
