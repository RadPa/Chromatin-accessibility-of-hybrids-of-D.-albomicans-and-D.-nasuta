jpeg("ALB-ALB.all.mp.jpeg",width = 12, height = 4, units = 'in', res = 1200)
par(mar = c(4, 6, 1.5, 5))
c <- read.table("~/reseq/thetas/ALB_IND_theta.50_50.gz.pestPG")
b <- read.table("/home/morpheus/atac/input/circos/deseq2_qval_sig.txt")
a <- read.table("~/reseq/thetas/NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
b[which(b$V1=="chr4"),]-> Chr4
plot(chr4$V3,chr4$V4/chr4$V14,type="l",axes=FALSE,ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext(expression(bolditalic(paste(theta["w"]))),side=2,line=4.5,cex=1.5,font=4)
c[which(c$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",col="blue",lwd=3)

box()
par(new=TRUE)
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2 -> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2(fold change)",side=4,line=3.5,cex=1.5,font=2,col="red")
legend("topleft", legend=c("D. albomicans (IND)","D. nasuta (IND)"), fill=c("blue","black"),text.font=4)
dev.off()

jpeg("Chr2r_ALB_IND-NAS_IND.theta.acc.jpeg",width = 12, height = 4, units = 'in', res = 1200)
par(mar = c(4, 6, 1.5, 5))
c <- read.table("~/reseq/thetas/ALB_IND_theta.50_50.gz.pestPG")
b <- read.table("/home/morpheus/atac/input/circos/deseq2_qval_sig.txt")
a <- read.table("~/reseq/thetas/NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
b[which(b$V1=="chr2R"),]-> Chr2r
plot(chr2r$V3,chr2r$V4/chr2r$V14,type="l",axes=FALSE,ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext(expression(bolditalic(paste(theta["w"]))),side=2,line=4.5,cex=1.5,font=4)
c[which(c$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",col="blue",lwd=3)

box()
par(new=TRUE)
(Chr2r$V3+Chr2r$V2)/2 -> Chr2r$V5
Chr2r$V3-Chr2r$V2 -> Chr2r$V6
plot(Chr2r$V5,Chr2r$V4,pch=20,cex=log10(Chr2r$V6),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2(fold change)",side=4,line=3.5,cex=1.5,font=2,col="red")
legend("topleft", legend=c("D. albomicans (IND)","D. nasuta (IND)"), fill=c("blue","black"),text.font=4)
dev.off()

