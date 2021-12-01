#!/bin/R

#Custom libraries
#txdb_alb <- loadDb("/home/morpheus/radhika/shft/txdb_alb.sqlite")
#library(BSgenome.Dalbomicans.dalbv1)

library(ATACseqQC)
setwd("/home/morpheus/radhika/shft")

message ("loading aat1 bams with dup")
aat1.bamfile <- ("/home/morpheus/radhika/shft/AAT1.mtrm.bam") 
aat1.bamfile.labels <- gsub(".mtdrm", "", basename(aat1.bamfile))  

message ("loading aat2 bams with dup")
aat2.bamfile <- ("/home/morpheus/radhika/shft/AAT2.mtrm.bam") 
aat2.bamfile.labels <- gsub(".mtdrm", "", basename(aat2.bamfile))  

message ("loading ant1 bams with dup")
ant1.bamfile <- ("/home/morpheus/radhika/shft/ANT1.mtrm.bam") 
ant1.bamfile.labels <- gsub(".mtdrm", "", basename(ant1.bamfile))  

message ("loading aat2 bams with dup")
ant2.bamfile <- ("/home/morpheus/radhika/shft/ANT2.mtrm.bam") 
ant2.bamfile.labels <- gsub(".mtdrm", "", basename(ant2.bamfile))  

message ("library complexity")
#Estimating library complexity
png("aat1.lib.png")
estimateLibComplexity(readsDupFreq(aat1.bamfile))
dev.off()

png("aat2.lib.png")
estimateLibComplexity(readsDupFreq(aat2.bamfile))
dev.off()

png("ant1.lib.png")
estimateLibComplexity(readsDupFreq(ant1.bamfile))
dev.off()

png("ant2.lib.png")
estimateLibComplexity(readsDupFreq(ant2.bamfile))
dev.off()

#Fragment size
png("aat1.fz.png")
fragSize <- fragSizeDist(aat1.bamfile, aat1.bamfile.labels)
dev.off()

png("aat2.fz.png")
fragSize <- fragSizeDist(aat2.bamfile, aat2.bamfile.labels)
dev.off()

png("ant1.fz.png")
fragSize <- fragSizeDist(ant1.bamfile, ant1.bamfile.labels)
dev.off()

png("ant2.fz.png")
fragSize <- fragSizeDist(ant2.bamfile, ant2.bamfile.labels)
dev.off()

#Shifting bam 
#tag generation
possibleTag <- list("integer"=c("AM", "AS", "CM", "CP", "FI", "H0", "H1", "H2",  
                               "HI", "IH", "MQ", "NH", "NM", "OP", "PQ", "SM", 
                               "TC", "UQ"),  
                 "character"=c("BC", "BQ", "BZ", "CB", "CC", "CO", "CQ", "CR", 
                               "CS", "CT", "CY", "E2", "FS", "LB", "MC", "MD", 
                               "MI", "OA", "OC", "OQ", "OX", "PG", "PT", "PU", 
                               "Q2", "QT", "QX", "R2", "RG", "RX", "SA", "TS", 
                               "U2"))
   
message ("loading aat1 bams without dup")
aat1.bamfile <- ("/home/morpheus/radhika/shft/AAT1.mtrm.bam") 
aat1.bamfile.labels <- gsub(".mtdrm", "", basename(aat1.bamfile))  

message ("loading aat2 bams without dup")
aat2.bamfile <- ("/home/morpheus/radhika/shft/AAT2.mtrm.bam") 
aat2.bamfile.labels <- gsub(".mtdrm", "", basename(aat2.bamfile))  

message ("loading ant1 bams without dup")
ant1.bamfile <- ("/home/morpheus/radhika/shft/ANT1.mtrm.bam") 
ant1.bamfile.labels <- gsub(".mtdrm", "", basename(ant1.bamfile))  

message ("loading aat2 bams without dup")
ant2.bamfile <- ("/home/morpheus/radhika/shft/ANT2.mtrm.bam") 
ant2.bamfile.labels <- gsub(".mtdrm", "", basename(ant2.bamfile))

#load libraries
message ("genome features")  
library(GenomicFeatures)
library(BSgenome.Dalbomicans.dalbv1)
txdb_alb <- loadDb("/home/morpheus/radhika/shft/txdb_alb.sqlite")

#Genome information
genome <- Dalbomicans
seqinformation <- seqinfo(txdb_alb) 				
seqlev <- c("NC_047627.1", "NC_047628.1", "NC_047629.1", "NC_047630.1", "NC_047631.1", "NW_022995738.1", "NW_022995739.1", "NW_022995740.1", "NW_022995741.1", "NW_022995742.1", "NC_027937.1")
which <- as(seqinformation[seqlev], "GRanges")
txs <- transcripts(txdb_alb)

message ("scanbam aat1")                               
library(Rsamtools)
bamTop100 <- scanBam(BamFile(aat1.bamfile, yieldSize = 100),
                     param = ScanBamParam(tag=unlist(possibleTag)))[[1]]$tag
tags <- names(bamTop100)[lengths(bamTop100)>0]
tags <- tags[tags!="PG"] 
tags

message ("shifting aat1")  
#shifting bam reads
aat1.gal <- readBamFile(aat1.bamfile, tag=tags, which=which, asMates=TRUE, bigFile=TRUE, keepDuplicates=TRUE)
aat1.shiftedBamfile <- file.path("/home/morpheus/radhika/shft", "aat1.shifted.bam")
aat1.gal1 <- shiftGAlignmentsList(aat1.gal, outbam=aat1.shiftedBamfile)

message ("scanbam aat2")                               
library(Rsamtools)
bamTop100 <- scanBam(BamFile(aat2.bamfile, yieldSize = 100),
                     param = ScanBamParam(tag=unlist(possibleTag)))[[1]]$tag
tags <- names(bamTop100)[lengths(bamTop100)>0]
tags <- tags[tags!="PG"] 
tags

message ("shifting aat2")  
#shifting bam reads
aat2.gal <- readBamFile(aat2.bamfile, tag=tags, which=which, asMates=TRUE, bigFile=TRUE, keepDuplicates=TRUE)
aat2.shiftedBamfile <- file.path("/home/morpheus/radhika/shft", "aat2.shifted.bam")
aat2.gal1 <- shiftGAlignmentsList(aat2.gal, outbam=aat2.shiftedBamfile)

message ("scanbam ant1")                               
library(Rsamtools)
bamTop100 <- scanBam(BamFile(ant1.bamfile, yieldSize = 100),
                     param = ScanBamParam(tag=unlist(possibleTag)))[[1]]$tag
tags <- names(bamTop100)[lengths(bamTop100)>0]
tags <- tags[tags!="PG"] 
tags

message ("shifting ant1")  
#shifting bam reads
ant1.gal <- readBamFile(ant1.bamfile, tag=tags, which=which, asMates=TRUE, bigFile=TRUE, keepDuplicates=TRUE)
ant1.shiftedBamfile <- file.path("/home/morpheus/radhika/shft", "ant1.shifted.bam")
ant1.gal1 <- shiftGAlignmentsList(ant1.gal, outbam=ant1.shiftedBamfile)

message ("scanbam ant2")                               
library(Rsamtools)
bamTop100 <- scanBam(BamFile(ant2.bamfile, yieldSize = 100),
                     param = ScanBamParam(tag=unlist(possibleTag)))[[1]]$tag
tags <- names(bamTop100)[lengths(bamTop100)>0]
tags <- tags[tags!="PG"] 
tags

message ("shifting ant2")  
#shifting bam reads
ant2.gal <- readBamFile(ant2.bamfile, tag=tags, which=which, asMates=TRUE, bigFile=TRUE, keepDuplicates=TRUE)
ant2.shiftedBamfile <- file.path("/home/morpheus/radhika/shft", "ant2.shifted.bam")
ant2.gal1 <- shiftGAlignmentsList(ant2.gal, outbam=ant2.shiftedBamfile)
q("yes")
