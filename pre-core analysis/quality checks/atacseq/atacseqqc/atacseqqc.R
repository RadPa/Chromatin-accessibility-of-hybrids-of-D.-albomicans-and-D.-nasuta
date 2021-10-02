#!/bin/R

#Custom libraries
#txdb_alb <- loadDb("/home/radhika/atac/info-g/txdb_alb.sqlite")
#library(BSgenome.Dalbomicans.dalbv1)

library(ATACseqQC)
setwd("/home/radhika/atac/unfiltered/")


message ("loading ant2 bams")
bamfile <- ("/home/radhika/atac/unfiltered/AAT1.sdup.bam") 
bamfile.labels <- gsub(".sdup.bam", "", basename(bamfile))  

message ("library complexity")
#Estimating library complexity
png("ant2.lib.png")
estimateLibComplexity(readsDupFreq(bamfile))
dev.off()

#Fragment size
png("ant2.fz.png")
fragSize <- fragSizeDist(bamfile, bamfile.labels)
dev.off()

#tag generation
possibleTag <- list("integer"=c("AM", "AS", "CM", "CP", "FI", "H0", "H1", "H2",  
                               "HI", "IH", "MQ", "NH", "NM", "OP", "PQ", "SM", 
                               "TC", "UQ"),  
                 "character"=c("BC", "BQ", "BZ", "CB", "CC", "CO", "CQ", "CR", 
                               "CS", "CT", "CY", "E2", "FS", "LB", "MC", "MD", 
                               "MI", "OA", "OC", "OQ", "OX", "PG", "PT", "PU", 
                               "Q2", "QT", "QX", "R2", "RG", "RX", "SA", "TS", 
                               "U2"))
message ("scanbam")                               
library(Rsamtools)
bamTop100 <- scanBam(BamFile(bamfile, yieldSize = 100),
                     param = ScanBamParam(tag=unlist(possibleTag)))[[1]]$tag
tags <- names(bamTop100)[lengths(bamTop100)>0]
tags
       
#load libraries
message ("genome features")  
library(GenomicFeatures)
library(BSgenome.Dalbomicans.dalbv1)
txdb_alb <- loadDb("/home/radhika/atac/info-g/txdb_alb.sqlite")

#Genome information
genome <- Dalbomicans
seqinformation <- seqinfo(txdb_alb) 				
seqlev <- c("NC_047627.1", "NC_047628.1", "NC_047629.1", "NC_047630.1", "NC_047631.1", "NW_022995738.1", "NW_022995739.1", "NW_022995740.1", "NW_022995741.1", "NW_022995742.1", "NC_027937.1")
which <- as(seqinformation[seqlev], "GRanges")
txs <- transcripts(txdb_alb)

#Shifting bam reads
message ("shifting bam")  
gal <- readBamFile(bamfile, tag=tags, which=which, asMates=TRUE, bigFile=TRUE)
shiftedBamfile <- file.path("/home/radhika/atac/unfiltered/", "ant2.shifted.bam")
gal1 <- shiftGAlignmentsList(gal, outbam=shiftedBamfile)

message ("scoring")
#PT scrore
pt <- PTscore(gal1, txs)
png("pts.ant2.png")
plot(pt$log2meanCoverage, pt$PT_score, 
     xlab="log2 mean coverage",
     ylab="Promoter vs Transcript")
dev.off()
#NFR regions
nfr <- NFRscore(gal1, txs)
png("nfr.ant2.png")
plot(nfr$log2meanCoverage, nfr$NFR_score, 
     xlab="log2 mean coverage",
     ylab="Nucleosome Free Regions score",
     main="NFRscore for 200bp flanking TSSs",
     xlim=c(-10, 0), ylim=c(-5, 5))
dev.off()
     
#Transcription Start Site (TSS) Enrichment Score
tsse <- TSSEscore(gal1, txs)
message("TSS")
tsse$TSSEscore
png("tss.ant2.png")
plot(100*(-9:10-.5), tsse$values, type="b", 
     xlab="distance to TSS",
     ylab="aggregate TSS score")
dev.off()     

#Shift and split at one step
#doesnot work for refseq seq names
#objs <- splitBam(ant2, tags=tags, "/home/radhika/atac/unfiltered/",
                 #txs=txs, genome=genome)
message ("splitting bams")                
#Split reads
objs <- splitGAlignmentsByCut(gal1,
				txs=txs, 
				genome=genome, 
				outPath = "/home/radhika/atac/unfiltered/")
message ("heat map")
#HeatMap
library(ChIPpeakAnno)
bamfiles <- file.path("/home/radhika/atac/unfiltered/",
                     c("NucleosomeFree.bam",
                     "mononucleosome.bam",
                     "dinucleosome.bam",
                     "trinucleosome.bam"))  
png("ant2-x.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NC_047627.1"], "GRanges"))
dev.off()
png("ant2-2l.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NC_047628.1"], "GRanges"))
dev.off()
png("ant2-3.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NC_047629.1"], "GRanges"))
dev.off()
png("ant2-4.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NC_047630.1"], "GRanges"))  
dev.off()
png("ant2-2r.png")                                        
cumulativePercentage(bamfiles[1:2], as(seqinformation["NC_047631.1"], "GRanges"))
dev.off()
png("ant2-s38.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NW_022995738.1"], "GRanges"))
dev.off()
png("ant2-s39.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NW_022995739.1"], "GRanges"))
dev.off()
png("ant2-s40.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NW_022995740.1"], "GRanges"))
dev.off()
png("ant2-s41.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NW_022995741.1"], "GRanges"))
dev.off()
png("ant2-s42.png")
cumulativePercentage(bamfiles[1:2], as(seqinformation["NW_022995742.1"], "GRanges"))
dev.off()

message("TSS")
TSS <- promoters(txs, upstream=0, downstream=1)
TSS <- unique(TSS)
## estimate the library size for normalization
message("library size")
(librarySize <- estLibSize(bamfiles))

## calculate the signals around TSSs.
NTILE <- 101
dws <- ups <- 1010
sigs <- enrichedFragments(gal=objs[c("NucleosomeFree", "mononucleosome", "dinucleosome", "trinucleosome")], 
                          TSS=TSS,
                          librarySize=librarySize,
                          seqlev=seqlev,
                          TSS.filter=0.5,
                          n.tile = NTILE,
                          upstream = ups,
                          downstream = dws)
## log2 transformed signals
sigs.log2 <- lapply(sigs, function(.ele) log2(.ele+1))
#plot heatmap
png("heatmap.ant2.png")
featureAlignedHeatmap(sigs.log2, reCenterPeaks(TSS, width=ups+dws),
                      zeroAt=.5, n.tile=NTILE)
dev.off()

#Normalized for nucelosome-free and nucleosome bound
out <- featureAlignedDistribution(sigs, 
                                  reCenterPeaks(TSS, width=ups+dws),
                                  zeroAt=.5, n.tile=NTILE, type="l", 
                                  ylab="Averaged coverage")

message("rescale")
## rescale the nucleosome-free and nucleosome signals to 0~1
range01 <- function(x){(x-min(x))/(max(x)-min(x))}
out <- apply(out, 2, range01)
png("nfns.ant2.png")
matplot(out, type="l", xaxt="n", 
        xlab="Position (bp)", 
        ylab="Fraction of signal")
axis(1, at=seq(0, 100, by=10)+1, 
     labels=c("-1K", seq(-800, 800, by=200), "1K"), las=2)
abline(v=seq(0, 100, by=10)+1, lty=2, col="gray")                                 
dev.off()

message("done")
q("yes")
                             
