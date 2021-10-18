#!/bin/bash

####TF prediction using TOBIAS v0.12.11####

source /home/radhika/py3-env/bin/activate
FA=/home/radhika/atac/tff/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna
BED=/home/radhika/atac/tff/tobi/peaks.nfr.shm1.bed
BLA=/home/radhika/atac/info-g/Dalb-at.v1.blacklist.bed
BLN=/home/radhika/atac/info-g/Dnas-at-dalb.v1.blacklist.bed
JAS=/home/radhika/atac/tff/20210819_JASPAR2018_combined_matrices_13546_jaspar.txt

echo ATACorrect 
TOBIAS ATACorrect --bam AAT.dupr.bam --genome "$FA" --peaks "$BED" --blacklist "$BLA" --cores 16 --prefix AATd
TOBIAS ATACorrect --bam ANT.dupr.bam --genome "$FA" --peaks "$BED" --blacklist "$BLN" --cores 16 --prefix ANTd

echo footprint-scores
TOBIAS ScoreBigwig --signal AATd_corrected.bw --regions "$BED" --output AATd_footprints.bw --cores 16
TOBIAS ScoreBigwig --signal ANTd_corrected.bw --regions "$BED" --output ANTd_footprints.bw --cores 16

echo BINDetect
TOBIAS BINDetect --signals AATd_footprints.bw ANTd_footprints.bw --peaks "$BED" --motifs "$JAS" --genome "$FA" --cond-names alb nas --prefix diff --outdir dudf --cores 16 
