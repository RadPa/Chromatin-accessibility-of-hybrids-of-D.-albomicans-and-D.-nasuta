#Loading library
library(karyoploteR)

custom.genome <- toGRanges("mygenome.txt")
accregs <- toGRanges("acc-p5.txt")
fchange <- toGRanges("fc.region.txt")

fc.ymax <- ceiling(max(abs(range(fchange$log2FoldChange))))
fc.ymin <- -fc.ymax

tiff("fc-accp5.tiff",width = 720, height = 600, units = "px", pointsize = 15)

kp <- plotKaryotype(genome = custom.genome)
kpPlotRegions(kp, accregs, r0 = 0, r1 = 0.8, col="purple")
kpPoints(kp, data=fchange, y=fchange$log2FoldChange, ymax=fc.ymax, ymin=fc.ymin)
kpAxis(kp, ymax=fc.ymax, ymin=fc.ymin, cex=0.6)
kpAddLabels(kp, labels = "log2 Fold Change", srt=90, pos=1, cex=0.6, label.margin = 0.05, ymax=fc.ymax, ymin=fc.ymin)

dev.off()
