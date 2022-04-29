A <- c("ALB_CHN.ALB_IND.50_50.fst.txt","ALB_CHN.ALB_JAP.50_50.fst.txt","ALB_CHN.ALB_TAI.50_50.fst.txt","ALB_IND.ALB_JAP.50_50.fst.txt","ALB_IND.ALB_TAI.50_50.fst.txt","ALB_JAP.ALB_TAI.50_50.fst.txt")

pdf("ALB-ALB.all.mp.pdf",height=20,width=30)
par(mfrow=c(4,1))

for(i in A){
a <- read.table(paste(i,sep=""))
ab  <- gsub(".50_50.fst.txt","",i)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chrx$chr),max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0

plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main=ab,ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=2)
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
mtext("FST",side=2, cex=2, font=4)
mtext("Chromosome",side=1, cex=2, font=4, line=3)
}
dev.off()

A <- c("NAS_FRA.NAS_IND.50_50.fst.txt","NAS_FRA.NAS_KEN.50_50.fst.txt","NAS_IND.NAS_KEN.50_50.fst.txt")

pdf("NAS-NAS.all.mp.pdf",height=20,width=30)
par(mfrow=c(4,1))

for(i in A){
a <- read.table(paste(i,sep=""))
ab  <- gsub(".50_50.fst.txt","",i)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chrx$chr),max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0

plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main=ab,ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=2)
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
mtext("FST",side=2, cex=2, font=4)
mtext("Chromosome",side=1, cex=2, font=4, line=3)
}
dev.off()

A <- c("ALB_CHN.NAS_FRA.50_50.fst.txt","ALB_CHN.NAS_IND.50_50.fst.txt","ALB_CHN.NAS_KEN.50_50.fst.txt","ALB_IND.NAS_FRA.50_50.fst.txt","ALB_IND.NAS_IND.50_50.fst.txt","ALB_IND.NAS_KEN.50_50.fst.txt","ALB_JAP.NAS_FRA.50_50.fst.txt","ALB_JAP.NAS_IND.50_50.fst.txt","ALB_JAP.NAS_KEN.50_50.fst.txt","ALB_TAI.NAS_FRA.50_50.fst.txt","ALB_TAI.NAS_IND.50_50.fst.txt","ALB_TAI.NAS_KEN.50_50.fst.txt")

pdf("ALB-NAS.all.mp.pdf",height=20,width=30)
par(mfrow=c(4,1))

for(i in A){
a <- read.table(paste(i,sep=""))
ab  <- gsub(".50_50.fst.txt","",i)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chrx$chr),max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0

plot(chrx$chr,chrx$Nsites, pch=20, col="red",xlim=c(0,gs),ylim=c(0,1),main=ab,ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=3,cex.lab=2)
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
mtext("FST",side=2, cex=2, font=4)
mtext("Chromosome",side=1, cex=2, font=4, line=3)
}
dev.off()

