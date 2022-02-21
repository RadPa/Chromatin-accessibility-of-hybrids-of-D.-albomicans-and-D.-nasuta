angsd=/home/morpheus/angsd
fasta=/home/morpheus/atac/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna
for POP in ALB_CHN ALB_IND ALB_JAP ALB_TAI NAS_FRA NAS_IND NAS_KEN
do
echo $POP
$angsd/angsd -P 64 -b $POP.bamlist -ref $fasta -anc $fasta -out FST/${POP}.ref -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 -minMapQ 20 -minQ 20 -minInd 3 -setMinDepthInd 10 -doCounts 1 -GL 1 -doSaf 1
$angsd/misc/realSFS FST/$POP.ref.saf.idx -P 64 2> /dev/null > FST/$POP.ref.sfs
done

for POP1 in ALB_CHN ALB_IND ALB_JAP ALB_TAI NAS_FRA NAS_IND NAS_KEN
do
for POP2 in ALB_CHN ALB_IND ALB_JAP ALB_TAI NAS_FRA NAS_IND NAS_KEN
do
$angsd/misc/realSFS -P 64 FST/$POP1.ref.saf.idx FST/$POP2.ref.saf.idx 2> /dev/null > FST/$POP1.$POP2.sfs
$angsd/misc/realSFS fst index FST/$POP1.ref.saf.idx FST/$POP2.ref.saf.idx -sfs FST/$POP1.$POP2.sfs -fstout FST/$POP1.$POP2 -whichFST 1
$angsd/misc/realSFS fst stats2 FST/$POP1.$POP2.fst.idx -win 50000 -step 1 -whichFST 1 > FST/$POP1.$POP2.50_1.fst.txt
$angsd/misc/realSFS fst stats2 FST/$POP1.$POP2.fst.idx -win 50000 -step 10000 -whichFST 1 > FST/$POP1.$POP2.50_10.fst.txt
$angsd/misc/realSFS fst stats2 FST/$POP1.$POP2.fst.idx -win 1 -step 1 -whichFST 1 > FST/$POP1.$POP2.1_1.fst.txt
$angsd/misc/realSFS fst stats2 FST/$POP1.$POP2.fst.idx -win 50000 -step 50000 -whichFST 1 > FST/$POP1.$POP2.50_50.fst.txt
done
done
