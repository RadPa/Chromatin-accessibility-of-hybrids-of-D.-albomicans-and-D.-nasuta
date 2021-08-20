# Alignment

The alignment of the adaptor removed reads to the reference genome of *D. albomicans*

## Mapping
The reads were mapped using `bowtie v2-2.4.2` to the reference genome

## Stats
`Samtools v1.11` a utility tool, for converting to formats, alignment statistics, and more

## Marking duplications
Optical duplicates are marked with `gatk v4.1.9.0 MarkDuplicates`

## Removing Mitochondria
Mitochondrial reads removed with `Samtools v1.11` as per the requirement of the peak callers

## Fragment length distribution
Aligned reads distribution with `gatk v4.1.9.0 CollectInsertSizeMetrics`

### Contents

