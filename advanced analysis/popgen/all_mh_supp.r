A <- c("ALB_CHN.ALB_IND.50_50.fst.txt","ALB_CHN.ALB_JAP.50_50.fst.txt","ALB_CHN.ALB_TAI.50_50.fst.txt","ALB_IND.ALB_JAP.50_50.fst.txt","ALB_IND.ALB_TAI.50_50.fst.txt","ALB_JAP.ALB_TAI.50_50.fst.txt")

jpeg("ALB_all_pop_FST.jpeg",width = 5, height = 10, units = 'in', res = 1200)
par(mfrow=c(6,1))

for(i in A){
a <- read.table(paste(i,sep=""))
ab  <- gsub(".50_50.fst.txt","",i)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0
par(mar = c(1, 4, 1, 2))
plot(chr2l$chr,chr2l$Nsites, pch=20, col="#cc0000ff",xlim=c(0,gs),ylim=c(0,1),main=ab, ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=1.5,cex.lab=2,font.main=4)
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="#e25ed9ff")

colcount <- max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="turquoise")

colcount <- max(chr2l$chr)+max(chr3$chr)
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="#ff9900ff")

colcount <- max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="#3fff00")
abline(h=0.9,lty=2,col="red")

axis(2, at=c(0,5,1), font.axis=4,cex.axis=2)
mtext(expression(bold("F"[ST])),side=2, cex=1.5, font=2)

mtext(c("Chr2L","Chr3","Chr4","Chr2R"), side=1, at = c(15362500,58487500,88187500,106212500),font=4,cex=1,line=1)
}
dev.off()

A <- c("NAS_FRA.NAS_IND.50_50.fst.txt","NAS_FRA.NAS_KEN.50_50.fst.txt","NAS_IND.NAS_KEN.50_50.fst.txt")

jpeg("NAS_all_pop_FST.jpeg",width = 8, height = 6, units = 'in', res = 1200)
par(mfrow=c(3,1))

for(i in A){
a <- read.table(paste(i,sep=""))
ab  <- gsub(".50_50.fst.txt","",i)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0
par(mar = c(2, 4, 4, 2))
plot(chr2l$chr,chr2l$Nsites, pch=20, col="#cc0000ff",xlim=c(0,gs),ylim=c(0,1),main=ab, ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=1.5,cex.lab=2,font.main=4)
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="#e25ed9ff")

colcount <- max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="turquoise")

colcount <- max(chr2l$chr)+max(chr3$chr)
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="#ff9900ff")

colcount <- max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="#3fff00")
abline(h=0.9,lty=2,col="red")

axis(2, at=c(0,5,1), font.axis=4,cex.axis=2)
mtext(expression(bold("F"[ST])),side=2, cex=1.5, font=2)

mtext(c("Chr2L","Chr3","Chr4","Chr2R"), side=1, at = c(15362500,58487500,88187500,106212500),font=4,cex=1,line=1)
}
dev.off()

A <- c("ALB_CHN.NAS_FRA.50_50.fst.txt","ALB_CHN.NAS_IND.50_50.fst.txt","ALB_CHN.NAS_KEN.50_50.fst.txt","ALB_IND.NAS_FRA.50_50.fst.txt","ALB_IND.NAS_IND.50_50.fst.txt","ALB_IND.NAS_KEN.50_50.fst.txt","ALB_JAP.NAS_FRA.50_50.fst.txt","ALB_JAP.NAS_IND.50_50.fst.txt","ALB_JAP.NAS_KEN.50_50.fst.txt","ALB_TAI.NAS_FRA.50_50.fst.txt","ALB_TAI.NAS_IND.50_50.fst.txt","ALB_TAI.NAS_KEN.50_50.fst.txt")

jpeg("ALB_NAS_all_pop_FST.jpeg",width = 6, height = 12, units = 'in', res = 1200)
par(mfrow=c(12,1))

for(i in A){
a <- read.table(paste(i,sep=""))
ab  <- gsub(".50_50.fst.txt","",i)
a[which(a$region=="NC_047627.1"),]-> chrx
a[which(a$region=="NC_047628.1"),]-> chr2l
a[which(a$region=="NC_047629.1"),]-> chr3
a[which(a$region=="NC_047630.1"),]-> chr4
a[which(a$region=="NC_047631.1"),]-> chr2r

gs <- sum(max(chr2l$chr),max(chr3$chr),max(chr4$chr),max(chr2r$chr))
colcount=0
par(mar = c(2, 4, 1, 2))
plot(chr2l$chr,chr2l$Nsites, pch=20, col="#cc0000ff",xlim=c(0,gs),ylim=c(0,1),main=ab, ylab="",xlab="",type="n",axes = FALSE,xaxt="n",font.lab=4,cex.main=1.5,cex.lab=2,font.main=4)
points(colcount+chr2l$chr,chr2l$Nsites,pch=20, col="#e25ed9ff")

colcount <- max(chr2l$chr)
points(colcount+chr3$chr,chr3$Nsites, pch=20, col="turquoise")

colcount <- max(chr2l$chr)+max(chr3$chr)
points(colcount+chr4$chr,chr4$Nsites, pch=20, col="#ff9900ff")

colcount <- max(chr2l$chr)+max(chr3$chr)+max(chr4$chr)
points(colcount+chr2r$chr,chr2r$Nsites, pch=20, col="#3fff00")
abline(h=0.9,lty=2,col="red")

axis(2, at=c(0,5,1), font.axis=4,cex.axis=2)
mtext(expression(bold("F"[ST])),side=2, cex=1.5, font=2)

mtext(c("Chr2L","Chr3","Chr4","Chr2R"), side=1, at = c(15362500,58487500,88187500,106212500),font=4,cex=1,line=1)
}
dev.off()

