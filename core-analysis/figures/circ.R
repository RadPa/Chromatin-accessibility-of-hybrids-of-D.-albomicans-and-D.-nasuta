#Library needed
library(circlize)

#Files needed
inf <- read.table("chrom.info", colClasses = c("character", "numeric", "numeric"), sep = "\t")
acc <- read.table("acc.nfr.sh.txt", colClasses = c("character", "numeric", "numeric", "numeric"), sep = "\t")
arm <- read.table("acc.sh.rm.txt", colClasses = c("character", "numeric", "numeric"), sep = "\t")
up <- read.table("up.txt", colClasses = c("character", "numeric", "numeric", "numeric"), sep = "\t")
do <- read.table("do.txt", colClasses = c("character", "numeric", "numeric", "numeric"), sep = "\t")
srm <- read.table("sig.acc.sh.srm.bed", colClasses = c("character", "numeric", "numeric"), sep = "\t")
colnames(srm)<- c("chr", "start", "end")
colnames(inf) <- c("chr", "start", "end")
colnames(acc) <- c("chr", "start", "end", "fold")
colnames(arm) <- c("chr", "start", "end")
colnames(up) <- c("chr", "start", "end", "fld")
colnames(do) <- c("chr", "start", "end", "fld")
bed_list <- list(up, do)

#circ drawing
png("circ.dalb.png", height = 4, width = 4, units= 'in', res = 600, pointsize = 12)
circos.par(gap.degree = 1.5, track.height = 0.1)
circos.genomicInitialize(inf, major.by = 10000000,
    plotType = c("labels", "axis"), tickLabelsStartFromZero = TRUE,
    axis.labels.cex = 0.25, labels.cex = 0.4)
circos.genomicTrack(acc, ylim=c(0,1), 
    bg.col = c("#a6bddb", "#9ecae1", "#bcbddc", "#fa9fb5", "#c7e9c0", "#bdbdbd", "#bdbdbd", "#bdbdbd", "#bdbdbd", "#bdbdbd"),
    panel.fun = function(region, value, ...){
    circos.genomicRect(region, value, border = NA, ...)
})
circos.genomicDensity(arm, col="#99d8c9")
circos.genomicTrack(bed_list, stack = TRUE, 
    panel.fun = function(region, value, ...) {
    col = ifelse(value[[1]] > 0, "#4292c6", "#ef3b2c")
    circos.genomicRect(region, value, col = col, border = col, ...)
})   
circos.genomicTrack(srm, stack = TRUE, 
    panel.fun = function(region, value, ...) {    
    circos.genomicRect(region, value, border = "#fcbba1", ...)
})
circos.clear()  
dev.off()
