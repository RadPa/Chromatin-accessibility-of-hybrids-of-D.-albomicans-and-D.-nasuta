#Figure 4A
library(pheatmap)

#BINDdetect for individual species
ind <- read.table("d.ind.score.txt", header=F, sep="\t")
colnames(ind) <- c("tf", "alb", "nas") 
sca <- ind[, -1]
tf <- ind[,1]

#Converting to Z-scores
map <- scale(sca)
rownames(map) <- tf

jpeg("heatmap-s.jpeg",height = 6, width = 8, units= 'in', res = 2400, pointsize = 12)
pheatmap(map, cluster_cols= F, cellwidth= 30, cutree_rows=20 , fontsize = 4, legend_labels=T, annotation_legend=T, show_rownames=T, border_color=F, gaps_col=T, color=colorRampPalette(c("navy", "white", "red"))(50), filename="heatmap-50l.jpeg")
dev.off()

#Figure 4B
#Loading TOBIAS results
tf <- read.table("vol.aj22.txt", header=F, sep="\t")
colnames(tf) <- c("names", "bsc", "pval")

png("Fig.4b.png", height = 5, width = 5, units= 'in', res = 1200, pointsize = 12)
par(mar=c(1.3, 1.6, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(-log10(pval) ~ bsc, pch=20, col=ifelse(-log10(tf$pval)>=quantile(-log10(tf$pval), 0.95) | bsc>=quantile(bsc, 0.95) | bsc<=quantile(bsc, 0.05), ifelse(bsc>0, "blue", "red"), "black"), tck=-0.01, mar=c(1.3, 1.6, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, xlab="", ylab="",  yaxt='n', tf)
axis(2, at=c(0,25,50,75,100,125,150,175), tck=-0.01, mar=c(1.3, 1.6, 0.3, 0.3), mgp=c(0, 0.5, 0), las=1)
legend(-0.15, 15, legend=c("Higher score in Dalb", "Higher score in Dnas"), col=c("blue", "red"), pch=20, cex=0.8)
text(-log10(tf$pval) ~ tf$bsc, labels=ifelse(-log10(tf$pval)>=quantile(-log10(tf$pval), 0.95) | tf$bsc>=quantile(tf$bsc, 0.95) | tf$bsc<=quantile(tf$bsc, 0.05), tf$names, ""), cex=0.7, pos=3, offset = 0.2)
dev.off()
