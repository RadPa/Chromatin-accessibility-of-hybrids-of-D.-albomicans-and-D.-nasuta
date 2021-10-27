#!/bin/bash

####TF prediction using TOBIAS v0.12.11####

source /home/radhika/py3-env/bin/activate
FA=/home/radhika/atac/tff/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna
BED=/home/radhika/atac/tff/tobi/dac.tes.x7.peak.bed
BLA=/home/radhika/atac/info-g/Dalb-pub.sm.v1.blacklist.bed
JAS=/home/radhika/atac/tff/JASPAR2020_CORE_insects_non-redundant_pfms_jaspar.txt
JASCM=/home/radhika/atac/tff/20211027072622_JASPAR2022_combined_matrices_25153_jaspar.txt

echo ATACorrect 
TOBIAS ATACorrect --bam AAT.x7.mer.bam --genome "$FA" --peaks "$BED" --blacklist "$BLA" --cores 16 --prefix AATx7
TOBIAS ATACorrect --bam ANT.x7.mer.bam --genome "$FA" --peaks "$BED" --blacklist "$BLA" --cores 16 --prefix ANTx7

echo footprint-scores
TOBIAS ScoreBigwig --signal AATx7_corrected.bw --regions "$BED" --output AATx7_footprints.bw --cores 16
TOBIAS ScoreBigwig --signal ANTx7_corrected.bw --regions "$BED" --output ANTx7_footprints.bw --cores 16

echo BINDetect
TOBIAS BINDetect --signals AATx7_footprints.bw ANTx7_footprints.bw --peaks "$BED" --motifs "$JAS" --genome "$FA" --cond-names alb nas --prefix dac --outdir dac-nr --cores 16
TOBIAS BINDetect --signals AATx7_footprints.bw ANTx7_footprints.bw --peaks "$BED" --motifs "$JASCM" --genome "$FA" --cond-names alb nas --prefix dac --outdir dac-cm --cores 16

echo TOBIAS done
