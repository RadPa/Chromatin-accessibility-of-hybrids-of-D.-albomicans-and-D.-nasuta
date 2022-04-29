a <- read.table("ALB_IND.ALB_JAP.50_50.fst.txt")

pdf("ALB_IND.ALB_JAP_Fst_mann.pdf",height=10,width=30)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r
BP <- c(dim(chrx)[1],dim(chr2l)[1],dim(chr3)[1],dim(chr4)[1],dim(chr2r)[1])

plot(a$Nsites,pch=20,main="Fst ALB_IND vs ALB_JAP",cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2)
abline(h=0.5,lty="dashed",col="red")
points(chrx$Nsites, pch=20, col="red")
points(chr2l$Nsites, pch=20, col="magenta")
points(chr3$Nsites, pch=20, col="greenyellow")
points(chr4$Nsites, pch=20, col="orange")
points(chr2r$Nsites, pch=20, col="blue")

dev.off()

gs <- sum(max(chrx$chr),max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),ylab="FST",xlab="Chromosome",type="n")
rect(0,0,max(chrx$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(chrx$chr,chrx$Nsites, pch=20, col="red")
colcount <- max(chrx$chr)
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="magenta")
colcount <- max(chrx$chr)+max(chr2l$chr)
rect(colcount,0,colcount+max(chr3$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="greenyellow")
colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="orange")
colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
rect(colcount,0,colcount+max(chr2r$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="blue")
abline(h=0.5,lty=2,col="red")


#########

a <- read.table("ALB_IND.ALB_JAP.50_50.fst.txt")
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chrx$chr),max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0
pdf("ALB_IND.ALB_JAP.FST.mp.pdf",height=10,width=30)
plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main="ALB_IND.ALB_JAP",ylab="FST",xlab="Chromosome",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=3)
points(chrx$chr,chrx$Nsites, pch=20, col="red")

colcount <- max(chrx$chr)
rect(colcount,0,colcount+max(chr2l$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="magenta")

colcount <- max(chrx$chr)+max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="greenyellow")

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)
rect(colcount,0,colcount+max(chr4$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="orange")

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="blue")
abline(h=0.5,lty=2,col="red")

axis(1, at = c(16687500,48737500,91862500,121537500,139537500), labels= c("ChrX","Chr2L","Chr3","Chr4","Chr2R"), font.axis=4,cex.axis=3)

axis(2, at=c(0,0.25,5,0.75,1), font.axis=4,cex.axis=3)
box()
dev.off()

###########

a <- read.table("ALB_IND.ALB_JAP.50_50.fst.txt")
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chrx$chr),max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0
pdf("ALB_NAS.mp.pdf",height=20,width=30)
par(mfrow=c(4,1))
plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main="ALB_IND.ALB_JAP",ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=2)
points(chrx$chr,chrx$Nsites, pch=20, col="red",cex=1.5)

colcount <- max(chrx$chr)
rect(colcount,0,colcount+max(chr2l$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="magenta",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="greenyellow",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)
rect(colcount,0,colcount+max(chr4$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="orange",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="blue",cex=1.5)
abline(h=0.9,lty=2,col="red")

axis(2, at=c(0,5,1), font.axis=4,cex.axis=2)

a <- read.table("NAS_FRA.NAS_IND.50_50.fst.txt")
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

colcount=0

plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main="NAS_FRA.NAS_IND",ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=2)
points(chrx$chr,chrx$Nsites, pch=20, col="red",cex=1.5)

colcount <- max(chrx$chr)
rect(colcount,0,colcount+max(chr2l$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="magenta",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="greenyellow",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)
rect(colcount,0,colcount+max(chr4$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="orange",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="blue",cex=1.5)
abline(h=0.9,lty=2,col="red")

axis(2, at=c(0,5,1), font.axis=4,cex.axis=2)
mtext("FST",side=2, cex=3, font=4)

a <- read.table("ALB_IND.NAS_IND.50_50.fst.txt")
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

colcount=0

plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main="ALB_IND.NAS_IND",ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=2)
points(chrx$chr,chrx$Nsites, pch=20, col="red",cex=1.5)

colcount <- max(chrx$chr)
rect(colcount,0,colcount+max(chr2l$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="magenta",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="greenyellow",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)
rect(colcount,0,colcount+max(chr4$chr),1, col=scales::alpha(rgb(col2rgb("black")[1,],col2rgb("black")[2,],col2rgb("black")[3,],max = 255), 0.25),border="transparent")
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="orange",cex=1.5)

colcount <- max(chrx$chr)+max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="blue",cex=1.5)
abline(h=0.9,lty=2,col="red")

axis(2, at=c(0,5,1), font.axis=4,cex.axis=2)

mtext(c("ChrX","Chr2L","Chr3","Chr4","Chr2R"), side=1, at = c(16687500,48737500,91862500,121537500,139537500),font=4,cex=2,line=1)

mtext("Chromosome",side=1, cex=3, font=4, line=3)

par(mar = c(6, 9, 4, 8))
c <- read.table("~/reseq/thetas/ALB_IND_theta.50_50.gz.pestPG")
b <- read.table("/home/morpheus/atac/input/circos/deseq2_qval_sig.txt")
a <- read.table("~/reseq/thetas/NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
b[which(b$V1=="chr4"),]-> Chr4
b[which(b$padj<=0.1),]->B

plot(chr4$V3,chr4$V4/chr4$V14,type="l",axes=FALSE,ylab="",main="Chr4 Waterson's Theta and diff. accessible regions",xlab="Genomic co-ordinates",font.lab=2,cex.lab=3,cex.main=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
mtext("Theta (tW)",side=2,line=6,cex=2,font=2)
c[which(c$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",col="blue")
box()
par(new=TRUE)
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2 -> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=2,font.axis=2,col.axis="red")
mtext("-log10FC",side=4,line=6,cex=2,font=2,col="red")

dev.off()



a <- read.table("~/reseq/thetas/ALB_CHN_theta.50_50.gz.pestPG")
b <- read.table("/home/morpheus/atac/input/circos/deseq2_qval_sig.txt")
a[which(a$V2=="NC_047630.1"),]-> chr4
b[which(b$V1=="chr4"),]-> Chr4
b[which(b$padj<=0.1),]->B
plot(chr4$V3,chr4$V4/chr4$V14,type="l",axes=FALSE,ylab="",main="Chr4 Waterson's Theta and diff. accessible regions",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Theta (tW)",side=2,line=3,cex=1.5,font=2)
box()
par(new=TRUE)
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2 -> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="red",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("-log10FC",side=4,line=4,cex=1.5,font=2)



plot(chr4$V3,chr4$V4/chr4$V14,pch=20,cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2)

par(mar = c(6, 5.2, 4, 6))
plot(chr4$V3,chr4$V4/chr4$V14,type="l",axes=FALSE,ylab="",main="Chr4 Waterson's Theta and diff. accessible regions",xlab="Genomic co-ordinates",font.lab=2,cex.lab=2,cex.main=2)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Theta (tW)",side=2,line=3,cex=1.5,font=2)
box()
par(new=TRUE)
b[which(b$V1=="NC_047630.1"),]-> Chr4
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2-> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="")
axis(4,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("-log10FC",side=4,line=4,cex=1.5,font=2)


