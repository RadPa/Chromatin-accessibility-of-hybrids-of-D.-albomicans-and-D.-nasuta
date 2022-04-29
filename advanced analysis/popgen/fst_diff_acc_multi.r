jpeg("ALB_IND.NAS_IND_FSTvsdiff_acc_qval_multi.jpeg",width = 10, height = 8, units = 'in', res = 1200)
a <- read.table(file="ALB_IND.NAS_IND.50_50.fst.txt",header=TRUE)
pop <- gsub(".50_50.fst.txt","",i)

b <- read.table("/home/morpheus/reseq/FST/deseq_dac.bed")
layout(matrix(c(1, 2, 3, 4, 2, 5), ncol=2))
#Chr2l
a[which(a$region=="NC_047628.1"),]-> chr2l
par(mar = c(4, 5, 2, 3))
plot(chr2l$chr,chr2l$Nsites,type="l",axes=FALSE,ylab="",main="Chr2l",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext(expression(bold("F"[ST])),side=2,line=3,font=2)
box()
par(new=TRUE)
b[which(b$V1=="NC_047628.1"),]-> Chr2l
(Chr2l$V3+Chr2l$V2)/2 -> Chr2l$mean
Chr2l$V3-Chr2l$V2-> Chr2l$length
plot(Chr2l$mean,Chr2l$V4,pch=20,cex=log10(Chr2l$length),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="red",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
#mtext("-log2(fold change)",side=4,line=3,font=2,col="red")

#Chr3
a[which(a$region=="NC_047629.1"),]-> chr3
par(mar = c(4, 5, 2, 5))
plot(chr3$chr,chr3$Nsites,type="l",axes=FALSE,ylab="",main="Chr3",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext(expression(bold("F"[ST])),side=2,font=2, line=3)
box()
par(new=TRUE)
b[which(b$V1=="NC_047629.1"),]-> Chr3
(Chr3$V3+Chr3$V2)/2 -> Chr3$mean
Chr3$V3-Chr3$V2-> Chr3$length
plot(Chr3$mean,Chr3$V4,pch=20,cex=log10(Chr3$length),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="red",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2(fold change)",side=4,line=3,font=2,col="red")

#Chr4
a[which(a$region=="NC_047630.1"),]-> chr4
par(mar = c(4, 5, 2, 3))
plot(chr4$chr,chr4$Nsites,type="l",axes=FALSE,ylab="",main="Chr4",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext(expression(bold("F"[ST])),side=2,font=2, line=3)
box()
par(new=TRUE)
b[which(b$V1=="NC_047630.1"),]-> Chr4
(Chr4$V3+Chr4$V2)/2 -> Chr4$mean
Chr4$V3-Chr4$V2-> Chr4$length
plot(Chr4$mean,Chr4$V4,pch=20,cex=log10(Chr4$length),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="red",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
#mtext("-log2(fold change)",side=4,line=3,font=2,col="red")

#Chr2r
a[which(a$region=="NC_047631.1"),]-> chr2r
par(mar = c(4, 3, 2, 5))
plot(chr2r$chr,chr2r$Nsites,type="l",axes=FALSE,ylab="",main="Chr2r",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
#mtext(expression(bold("F"[ST])),side=2,font=2, line=3)
box()
par(new=TRUE)
b[which(b$V1=="NC_047631.1"),]-> Chr2r
(Chr2r$V3+Chr2r$V2)/2 -> Chr2r$mean
Chr2r$V3-Chr2r$V2-> Chr2r$length
plot(Chr2r$mean,Chr2r$V4,pch=20,cex=log10(Chr2r$length),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="red",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2(fold change)",side=4,line=4,font=2,col="red")

#ChrX
a[which(a$region=="NC_047627.1"),]-> chrx
par(mar = c(4, 3, 2, 5))
plot(chrx$chr,chrx$Nsites,type="l",axes=FALSE,ylab="",main="ChrX",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
#mtext(expression(bold("F"[ST])),side=2,font=2, line=3)
box()
par(new=TRUE)
b[which(b$V1=="NC_047627.1"),]-> ChrX
(ChrX$V3+ChrX$V2)/2 -> ChrX$mean
ChrX$V3-ChrX$V2-> ChrX$length
plot(ChrX$mean,ChrX$V4,pch=20,cex=log10(ChrX$length),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="red",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2(fold change)",side=4,line=3,font=2,col="red")
dev.off()

