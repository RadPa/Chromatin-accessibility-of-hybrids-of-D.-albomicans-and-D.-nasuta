##Circos plot for DACs##
library(circlize)

#Files needed
inf <- read.table("chrom.info", colClasses = c("character", "numeric", "numeric"), sep = "\t")
acc <- read.table("acc.tes.nfr.txt", colClasses = c("character", "numeric", "numeric"), sep = "\t")
arm <- read.table("GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.v1.rm.bed", colClasses = c("character", "numeric", "numeric", "character"), sep = "\t")
up <- read.table("up.qv.txt", colClasses = c("character", "numeric", "numeric", "numeric", "numeric"), sep = "\t")
do <- read.table("do.qv.txt", colClasses = c("character", "numeric", "numeric", "numeric", "numeric"), sep = "\t")
#Colnames
colnames(inf) <- c("chr", "start", "end")
colnames(acc) <- c("chr", "start", "end")
colnames(arm) <- c("chr", "start", "end", "te")
colnames(up) <- c("chr", "start", "end", "fld", "qval")
colnames(do) <- c("chr", "start", "end", "fld", "qval")
# Combining
bed_list <- list(up, do)
#Plot
circos.par(gap.degree = 1.5, track.height = 0.1, track.margin = c(0, 0.02))
circos.genomicInitialize(inf, major.by = 10000000, 
    plotType = c("labels", "axis"), tickLabelsStartFromZero = TRUE,
    axis.labels.cex = 0.3, labels.cex = 0.7)
circos.genomicTrack(acc, ylim=c(0,1), 
    bg.col = c("#cc0000ff", "#e25ed9ff", "turquoise", "#ff9900ff", "#3fff00", "tan", "mistyrose3", "tan", "tan", "tan"),
    panel.fun = function(region, value, ...){
    circos.genomicRect(region, value, border = NA, ...)
})
#circos.genomicDensity(bla, col="black")
circos.genomicDensity(arm, col="#5d3954")
circos.genomicTrack(bed_list, stack = TRUE, 
    panel.fun = function(region, value, ...) {
    col = ifelse(value[[1]] > 0, "#4292c6", "#ef3b2c")
    circos.genomicRect(region, value, col = col, border = col, ...)
})   
circos.clear()
