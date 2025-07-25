#Packages needed for this exercise

library(DESeq2)
library(ggplot2)
library(reshape2)

#Importing count data

#at <- read.table("/home/radhika/atac/dacc/all.nfr.counts", header=F)
at <- read.table("tes.nfr.x7.sh.fcount", header=F)
fo <- read.table("info.txt", header=T)
colnames(at) <- c("Chr", "Start", "End", "AAT1", "AAT2","ANT1", "ANT2") 
rownames(at) <- paste0(at$Chr, ":", at$Start, "-", at$End)
rownames(fo) <- fo$Samples

#Normalizing the counts
counts <- at[,4:ncol(at)]
dds <- DESeqDataSetFromMatrix(countData = counts[,order(colnames(counts))], colData = fo, design = ~ Species)
dds <- DESeq(dds)

#Differential Peak calling
res <- results(dds, lfcThreshold=0, contrast=c("Species", "Dalbomicans", "Dnasuta"))
print(summary(res))

#Reporting Results 
write.table(as.data.frame(res), 
          file="tes.nfr.x7.sh.d.txt",sep="\t")

# Annotating peak regions
library(GenomicFeatures)
library(ChIPseeker)
txdb_alb <- loadDb("/home/radhika/atac/info-g/txdb_alb.sqlite")
gr <- makeGRangesFromDataFrame(at, keep.extra.columns=T)
peakAnno <- annotatePeak(gr, tssRegion=c(-1000, 1000), TxDb=txdb_alb)
png("peakanno.png")
plotAnnoPie(peakAnno)
dev.off()
        
#Data visualization
cm <- data.frame(counts(dds, normalized=TRUE))
lf <- melt(cm, id.vars=c())
pander(head(lf))

jpeg("normCounts.jpeg")
ggplot(data=lf, aes(x=variable, y=value)) + geom_boxplot(aes(group=variable)) + xlab("Sample") + ylab("Normalized Count") + coord_flip()
dev.off()

jpeg("normCounts-1.jpeg")
ggplot(data=lf, aes(x=value)) + geom_freqpoly(aes(group=variable, color=variable), bins=30) + xlab("Sample") + ylab("Normalized Count")
dev.off()

jpeg("lib.jpeg")
libsize <- data.frame(x=sizeFactors(dds), y=colSums(assay(dds)))
ggplot(data=libsize, aes(x=x, y=y)) + geom_point() + geom_smooth(method="lm") + xlab("Estimated size factor") + ylab("Library size")
dev.off()

#PCA
pca <- prcomp(t(cm))
print(summary(pca))
jpeg("pca.jpeg")
pcaData <- as.data.frame(pca$x)
pcaData$Samples <- rownames(pcaData)
pcaData=merge(pcaData, fo)
percentVar <- round(100 * (pca$sdev^2 / sum( pca$sdev^2 ) ))
p=ggplot(data=pcaData, aes(x = PC1, y = PC2, color=Species)) + geom_point(size=3)
p=p+xlab(paste0("PC1: ", percentVar[1], "% variance"))
p=p+ylab(paste0("PC2: ", percentVar[2], "% variance"))
print(p)
dev.off()

jpeg("pca-1.jpeg")
q=ggplot(data=pcaData, aes(x = PC3, y = PC4, color=Species)) + geom_point(size=3)
q=q+xlab(paste0("PC3: ", percentVar[3], "% variance"))
q=q+ylab(paste0("PC4: ", percentVar[4], "% variance"))
print(q)
dev.off()

#MA plot
jpeg("maPlot.jpeg")
plotMA(res, ylim = c(-5, 5))
dev.off()

#Load libraries
library(apeglm)
library(ashr)

resLFC <- lfcShrink(dds, coef=2, type="apeglm")
resNorm <- lfcShrink(dds, coef=2, type="normal")
resAsh <- lfcShrink(dds, coef=2, type="ashr")
jpeg("lfcshrink.jpeg")
par(mfrow=c(1,3), mar=c(4,4,2,1))
xlim <- c(1,1e5); ylim <- c(-3,3)
plotMA(resLFC, xlim=xlim, ylim=ylim, main="apeglm")
plotMA(resNorm, xlim=xlim, ylim=ylim, main="normal")
plotMA(resAsh, xlim=xlim, ylim=ylim, main="ashr")
dev.off()

jpeg("maLFC.jpeg")
plotMA(resLFC, ylim=c(-2,2))
dev.off()
