# Alignment

The alignment of the adaptor removed reads to the reference genome of *D. albomicans*

## Mapping
The reads were mapped using `bowtie v2-2.4.2` to the reference genome

## Stats
`Samtools v1.14` a utility tool, for converting to formats, alignment statistics, and more

## Marking duplications
Optical duplicates are marked with `gatk v4.2.2.0 MarkDuplicates`

## Removing Mitochondria
Mitochondrial reads removed with `Samtools v1.14` as per the requirement of the peak callers

## Fragment length distribution
Aligned reads distribution with `gatk v4.2.2.0 CollectInsertSizeMetrics`

## Number of bases in bam
```
/home/radhika/bedtools2/bin/bedtools genomecov -ibam bam -bga| awk '{s+=$4}END{print s}'
```
|Sample|adpTrReads(Gb)|mappedReads(Gb)|mtRmReads(Gb)|dupRmReads(Gb)|
|:---:|:---:|:---:|:---:|:---:|
|aat1|24.9|10.6|9.3|5.0|
|aat2|27.1|8.8|7.9|2.3|
|ant1|19.6|6.3|5.7|2.4|
|ant2|23.5|8.1|6.9|2.4|

### Contents

