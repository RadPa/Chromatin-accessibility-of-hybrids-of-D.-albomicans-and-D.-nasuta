##Figure 2A-F##
#Loading the merged peak regions by HMMRATC and the length of peak regions 
res <- read.table("nfr.tes.des.txt", header=T, sep="\t")
len <- read.table("nfr.tes.des.len.bed", header=F, sep="\t")

#Combining two files of same number of rows
colnames(len) <- "len"
res <- cbind(res, len)

#Coloring the chromosomes and unplaced scaffolds
res$col <- rownames(res)
res$col <- gsub("NC_047627.1.*", "#cc0000ff", res$col)
res$col <- gsub("NC_047628.1.*", "#e25ed9ff", res$col)
res$col <- gsub("NC_047629.1.*", "turquoise", res$col)
res$col <- gsub("NC_047630.1.*", "#ff9900ff", res$col)
res$col <- gsub("NC_047631.1.*", "#cae00d", res$col)
res$col <- gsub("NW_022995738.1.*", "tan", res$col)
res$col <- gsub("NW_022995739.1.*", "mistyrose3", res$col)
res$col <- gsub("NW_022995740.1.*", "tan", res$col)
res$col <- gsub("NW_022995741.1.*", "tan", res$col)
res$col <- gsub("NW_022995742.1.*", "tan", res$col)

#Labelling points
res$lab <- rownames(res)
res$lab <- gsub("NC_047627.1:627220-634590", "CG9240,CG8128,CG12708", res$lab)
res$lab <- gsub("NC_047627.1:1131890-1132220", "kek5", res$lab)
res$lab <- gsub("NC_047627.1:3423110-3423670", "lncRNA¹,CG9170", res$lab)
res$lab <- gsub("NC_047627.1:5111120-5111730", "lncRNA²", res$lab)
res$lab <- gsub("NC_047627.1:6452860-6453120", "Ten-a", res$lab)
res$lab <- gsub("NC_047627.1:11669870-11670380", "RhoGAP19D", res$lab) 
res$lab <- gsub("NC_047627.1:16239480-16243170", "unchar¹", res$lab)
res$lab <- gsub("NC_047627.1:21930660-21930930", "unchar²", res$lab)
res$lab <- gsub("NC_047627.1:25897760-25898120", "CG12432", res$lab)
res$lab <- gsub("NC_047628.1:2737580-2737970", "lncRNA", res$lab)
res$lab <- gsub("NC_047628.1:12689240-12689680", "unchar¹", res$lab)
res$lab <- gsub("NC_047628.1:30734676-30734886", "unchar²", res$lab)
res$lab <- gsub("NC_047628.1:30736998-30737208", "unchar³", res$lab)
res$lab <- gsub("NC_047628.1:30739516-30739746", "unchar⁴", res$lab)
res$lab <- gsub("NC_047629.1:2489020-2489300", "Ank2", res$lab)
res$lab <- gsub("NC_047629.1:8769720-8771910", "exex", res$lab)
res$lab <- gsub("NC_047629.1:12447320-12448950", "CG42673", res$lab)
res$lab <- gsub("NC_047629.1:13130630-13131820", "mthl1,lncRNA¹", res$lab)
res$lab <- gsub("NC_047629.1:20504630-20504930", "Abca1", res$lab)
res$lab <- gsub("NC_047629.1:20566770-20566970", "CG15706", res$lab)
res$lab <- gsub("NC_047629.1:20568430-20568740", "CG15707", res$lab)
res$lab <- gsub("NC_047629.1:20568990-20569200", "CG15708", res$lab)
res$lab <- gsub("NC_047629.1:20569750-20570300", "CG15709", res$lab)
res$lab <- gsub("NC_047629.1:26941520-26941830", "sff", res$lab)
res$lab <- gsub("NC_047629.1:30599620-30600010", "Oct-TyrR", res$lab)
res$lab <- gsub("NC_047630.1:2018950-2019500", "unc-13", res$lab)
res$lab <- gsub("NC_047630.1:2434140-2434680", "Abcd", res$lab)
res$lab <- gsub("NC_047630.1:2622130-2633160", "unchar¹,lncRNA¹", res$lab)
res$lab <- gsub("NC_047630.1:2775640-2817110", "Tdg,Pur-α,Fox", res$lab)
res$lab <- gsub("NC_047630.1:2820610-2821630", "Fox", res$lab)
res$lab <- gsub("NC_047630.1:3015970-3027590", "Arf2", res$lab)
res$lab <- gsub("NC_047630.1:3302790-3305310", "lncRNA²", res$lab)
res$lab <- gsub("NC_047630.1:3507000-3507470", "lncRNA³", res$lab)
res$lab <- gsub("NC_047630.1:3868160-3871850", "lncRNA⁴", res$lab)
res$lab <- gsub("NC_047631.1:1906960-1907380", "qless", res$lab)
res$lab <- gsub("NC_047631.1:18969030-18969350", "CG8997", res$lab)
res$lab <- gsub("NC_047631.1:25250210-25252010", "unchar", res$lab)
res$lab <- gsub("NC_047631.1:32214600-32219890", "Dscam2", res$lab)
res$lab <- gsub("NW_022995739.1:2217600-2217860", "unchar", res$lab)
res$lab <- gsub("NW_022995740.1:308480-308840", "lncRNA", res$lab)
res$lab <- gsub("NC_047627.1.*", "", res$lab)
res$lab <- gsub("NC_047628.1.*", "", res$lab)
res$lab <- gsub("NC_047629.1.*", "", res$lab)
res$lab <- gsub("NC_047630.1.*", "", res$lab)
res$lab <- gsub("NC_047631.1.*", "", res$lab)
res$lab <- gsub("NW_022995738.1.*", "", res$lab)
res$lab <- gsub("NW_022995739.1.*", "", res$lab)
res$lab <- gsub("NW_022995740.1.*", "", res$lab)
res$lab <- gsub("NW_022995741.1.*", "", res$lab)
res$lab <- gsub("NW_022995742.1.*", "", res$lab)

#Subsetting chromosomes for volcanoes
res.x <- subset(res, col=="#cc0000ff")
res.2l <- subset(res, col=="#e25ed9ff")
res.3 <- subset(res, col=="turquoise")
res.4 <- subset(res, col=="#ff9900ff")
res.2r <- subset(res, col=="#cae00d")

#Loading library for axis break
library(plotrix)

#Figure 2A
jpeg("vol.x.jpeg", height = 4, width = 4, units= 'in', res = 1600, pointsize = 12)
par(mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(-log10(pvalue) ~ log2FoldChange, pch=20, col=col, cex= ifelse(padj<=0.1,len/5000,0.01), xlim= c(-2,1.5), ylim=c(0,13), xlab="", ylab="", tck=-0.01, mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, res.x)
text(-log10(res.x$pvalue) ~ res.x$log2FoldChange, labels=res.x$lab, cex= 0.7, pos=3, offset = 0.5)
dev.off()

#Figure 2B
jpeg("vol.2l.jpeg", height = 4, width = 4, units= 'in', res = 1600, pointsize = 12)
par(mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(-log10(pvalue) ~ log2FoldChange, pch=20, col=col, cex= ifelse(padj<=0.1,len/5000,0.01), ylim=c(0,7), xlab="", ylab="", tck=-0.01, mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, res.2l)
text(-log10(res.2l$pvalue) ~ res.2l$log2FoldChange, labels=res.2l$lab, cex= 0.3, pos=3, offset = 0.5)
dev.off()

#Figure 2C
#For the y-axis break
ygap <- ifelse(-log10(res.3$pvalue) > 76, -log10(res.3$pvalue)-38, -log10(res.3$pvalue))
yat <- pretty(ygap)
yat <- yat[yat!=38]
ylab <- ifelse(yat>38, yat+38, yat)
jpeg("vol.3.jpeg", height = 4, width = 4, units= 'in', res = 1600, pointsize = 12)
par(mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(ygap ~ log2FoldChange, pch=20, col=col, cex= ifelse(padj<=0.1,len/5000,0.01), yaxt="n", xlab="", ylab="", tck=-0.01, mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, res.3)
axis(2, at=yat, tck=-0.01, labels=ylab)
axis.break(2, 38.2, style="slash")
text(-log10(res.3$pvalue) ~ res.3$log2FoldChange, labels=res.3$lab, cex= 0.7, pos=3, offset = 0.5)
dev.off()

#Figure 2D
jpeg("vol.4.jpeg", height = 4, width = 4, units= 'in', res = 1600, pointsize = 12)
par(mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(-log10(pvalue) ~ log2FoldChange, pch=20, col=col, cex= ifelse(padj<=0.1,len/5000,0.01), xlim=c(-2.5,1), ylim=c(0,10), xlab="", ylab="", tck=-0.01, mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, res.4)
text(-log10(res.4$pvalue) ~ res.4$log2FoldChange, labels=res.4$lab, cex= 0.7, pos=3, offset = 0.5)
dev.off()

#Figure 2E
#For the y-axis break
ygap <- ifelse(-log10(res.2r$pvalue) > 8, -log10(res.2r$pvalue)-8, -log10(res.2r$pvalue))
yat <- pretty(ygap)
yat <- yat[yat!=8]
ylab <- ifelse(yat>8, yat+8, yat)
jpeg("vol.2r-s.jpeg", height = 4, width = 4, units= 'in', res = 1600, pointsize = 12)
par(mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(ygap ~ log2FoldChange, pch=20, col=col, cex= ifelse(padj<=0.1,len/5000,0.01), yaxt="n", xlab="", ylab="", tck=-0.01, mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, res.2r)
axis(2, at=yat, tck=-0.01, labels=ylab)
axis.break(2, 8.2, style="slash")
text(-log10(res.2r$pvalue) ~ res.2r$log2FoldChange, labels=res.2r$lab, cex= 0.7, pos=3, offset = 0.5)
dev.off()

#Figure 2F
jpeg("vol.4-s.jpeg", height = 4, width = 4, units= 'in', res = 1600, pointsize = 12)
par(mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), cex.axis=0.8, cex.lab=1, las=1)
plot(-log10(pvalue) ~ log2FoldChange, pch=20, col=col, cex= ifelse(padj<=0.1,len/5000,0.01), xlim=c(-2.5,1), ylim=c(0,10), xlab="", ylab="", tck=-0.01, mar=c(1.3, 1.3, 0.3, 0.3), mgp=c(0, 0.3, 0), las=1, res.4)
text(-log10(res.u$pvalue) ~ res.u$log2FoldChange, labels=res.u$lab, cex= 0.7, pos=3, offset = 0.5)
dev.off()
