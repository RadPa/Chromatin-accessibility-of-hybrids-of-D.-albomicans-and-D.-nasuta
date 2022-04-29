jpeg("Chr4_tw_tp_rep_exon.jpeg",width=15,height=10,units='in',res=700)
par(mfrow=c(4,1))
par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047630.1"),]-> chr4
plot(chr4$V3,chr4$V4/chr4$V14,type="n",main=expression(bold("Chr 4") ~ bolditalic(paste(theta["w"]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.008),xlab="",ylab=expression(bolditalic(paste(theta["w"]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.5)
legend("topleft",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=2,cex=1.5)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047630.1"),]-> chr4
plot(chr4$V3,chr4$V5/chr4$V14,type="n",main=expression(bold("Chr 4") ~ bolditalic(paste(theta[pi]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.008),xlab="",ylab=expression(bolditalic(paste(theta[pi]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V5/chr4$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.5)
legend("topleft",c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=2,cex=1.5)

d <- read.table("/home/morpheus/reseq/FST/exons_50k_cov.bed")
e <- read.table("/home/morpheus/reseq/FST/chr4_rep_50k_cov.bed")
b <- read.table("/home/morpheus/reseq/FST/deseq_dac.txt",header=T)
b[which(b$Chr=="NC_047630.1"),] -> Chr4
b[which(b$qval<=0.1),]->B
d[which(d$V1=="NC_047630.1"),] -> D
par(mar=c(3,5,2,4))
plot(e$V3,e$V7,type="l",axes=FALSE,ylab="",main="Repeat Density in 50 Kb window",xlab="",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=5)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Repeat Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr4$Start+Chr4$End)/2 -> Chr4$mean
Chr4$End-Chr4$Start -> Chr4$length
plot(Chr4$mean,Chr4$log_fold_change,pch=20,cex=log10(Chr4$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=3,font=2,col="red")

par(mar=c(4,5,2,4))
plot(D$V3,D$V7,type="l",axes=FALSE,main="Exon Density in 50 Kb window",ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=5)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Exon Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr4$Start+Chr4$End)/2 -> Chr4$mean
Chr4$End-Chr4$Start -> Chr4$length
plot(Chr4$mean,Chr4$log_fold_change,pch=20,cex=log10(Chr4$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=3,font=2,col="red")
dev.off()

jpeg("chr2r_tw_tp_rep_exon.jpeg",width=15,height=10,units='in',res=700)
par(mfrow=c(4,1))
par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047631.1"),]-> chr2r
plot(chr2r$V3,chr2r$V4/chr2r$V14,type="n",main=expression(bold("Chr 2R") ~ bolditalic(paste(theta["w"]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta["w"]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V4/chr2r$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047631.1"),]-> chr2r
plot(chr2r$V3,chr2r$V5/chr2r$V14,type="n",main=expression(bold("Chr 2R") ~ bolditalic(paste(theta[pi]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta[pi]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V5/chr2r$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

d <- read.table("/home/morpheus/reseq/FST/exons_50k_cov.bed")
e <- read.table("/home/morpheus/reseq/FST/chr2r_rep_50k_cov.bed")
b <- read.table("/home/morpheus/reseq/FST/deseq_dac.txt",header=T)
b[which(b$Chr=="NC_047631.1"),] -> Chr2r
b[which(b$qval<=0.1),]->B
d[which(d$V1=="NC_047631.1"),]->D
par(mar=c(3,5,2,5))
plot(e$V3,e$V7,type="l",axes=FALSE,ylab="",main="Repeat Density in 50 Kb window",xlab="",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Repeat Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr2r$Start+Chr2r$End)/2 -> Chr2r$mean
Chr2r$End-Chr2r$Start -> Chr2r$length
plot(Chr2r$mean,Chr2r$log_fold_change,pch=20,cex=log10(Chr2r$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=4,font=2,col="red")

par(mar=c(4,5,2,5))
plot(D$V3,D$V7,type="l",axes=FALSE,main="Exon Density in 50 Kb window",ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Exon Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr2r$Start+Chr2r$End)/2 -> Chr2r$mean
Chr2r$End-Chr2r$Start -> Chr2r$length
plot(Chr2r$mean,Chr2r$log_fold_change,pch=20,cex=log10(Chr2r$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=4,font=2,col="red")
dev.off()

jpeg("chr2l_tw_tp_rep_exon.jpeg",width=15,height=10,units='in',res=700)
par(mfrow=c(4,1))
par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047628.1"),]-> chr2l
plot(chr2l$V3,chr2l$V4/chr2l$V14,type="n",main=expression(bold("Chr 2L") ~ bolditalic(paste(theta["w"]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta["w"]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V4/chr2l$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047628.1"),]-> chr2l
plot(chr2l$V3,chr2l$V5/chr2l$V14,type="n",main=expression(bold("Chr 2L") ~ bolditalic(paste(theta[pi]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta[pi]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V5/chr2l$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

d <- read.table("/home/morpheus/reseq/FST/exons_50k_cov.bed")
e <- read.table("/home/morpheus/reseq/FST/chr2l_rep_50k_cov.bed")
b <- read.table("/home/morpheus/reseq/FST/deseq_dac.txt",header=T)
b[which(b$Chr=="NC_047628.1"),]-> Chr2l
b[which(b$qval<=0.1),]->B
d[which(d$V1=="NC_047628.1"),]->D
par(mar=c(3,5,2,5))
plot(e$V3,e$V7,type="l",axes=FALSE,ylab="",main="Repeat Density in 50 Kb window",xlab="",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Repeat Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr2l$Start+Chr2l$End)/2 -> Chr2l$mean
Chr2l$End-Chr2l$Start -> Chr2l$length
plot(Chr2l$mean,Chr2l$log_fold_change,pch=20,cex=log10(Chr2l$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=4,font=2,col="red")

par(mar=c(4,5,2,5))
plot(D$V3,D$V7,type="l",axes=FALSE,main="Exon Density in 50 Kb window",ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Exon Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr2l$Start+Chr2l$End)/2 -> Chr2l$mean
Chr2l$End-Chr2l$Start -> Chr2l$length
plot(Chr2l$mean,Chr2l$log_fold_change,pch=20,cex=log10(Chr2l$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=4,font=2,col="red")
dev.off()

jpeg("chr3_tw_tp_rep_exon.jpeg",width=15,height=10,units='in',res=700)
par(mfrow=c(4,1))
par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047629.1"),]-> chr3
plot(chr3$V3,chr3$V4/chr3$V14,type="n",main=expression(bold("Chr 3") ~ bolditalic(paste(theta["w"]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta["w"]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V4/chr3$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047629.1"),]-> chr3
plot(chr3$V3,chr3$V5/chr3$V14,type="n",main=expression(bold("Chr 3") ~ bolditalic(paste(theta[pi]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta[pi]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V5/chr3$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

d <- read.table("/home/morpheus/reseq/FST/exons_50k_cov.bed")
e <- read.table("/home/morpheus/reseq/FST/chr3_rep_50k_cov.bed")
b <- read.table("/home/morpheus/reseq/FST/deseq_dac.txt",header=T)
b[which(b$Chr=="NC_047629.1"),]-> Chr3
b[which(b$qval<=0.1),]->B
d[which(d$V1=="NC_047629.1"),]->D
par(mar=c(3,5,2,5))
plot(e$V3,e$V7,type="l",axes=FALSE,ylab="",main="Repeat Density in 50 Kb window",xlab="",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Repeat Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr3$Start+Chr3$End)/2 -> Chr3$mean
Chr3$End-Chr3$Start -> Chr3$length
plot(Chr3$mean,Chr3$log_fold_change,pch=20,cex=log10(Chr3$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=3,font=2,col="red")

par(mar=c(4,5,2,5))
plot(D$V3,D$V7,type="l",axes=FALSE,main="Exon Density in 50 Kb window",ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Exon Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(Chr3$Start+Chr3$End)/2 -> Chr3$mean
Chr3$End-Chr3$Start -> Chr3$length
plot(Chr3$mean,Chr3$log_fold_change,pch=20,cex=log10(Chr3$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=3,font=2,col="red")
dev.off()

jpeg("chrx_tw_tp_rep_exon.jpeg",width=15,height=10,units='in',res=700)
par(mfrow=c(4,1))
par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047627.1"),]-> chrx
plot(chrx$V3,chrx$V4/chrx$V14,type="n",main=expression(bold("Chr X") ~ bolditalic(paste(theta["w"]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta["w"]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V4/chrx$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047627.1"),]-> chrx
plot(chrx$V3,chrx$V5/chrx$V14,type="n",main=expression(bold("Chr X") ~ bolditalic(paste(theta[pi]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(0,0.016),xlab="",ylab=expression(bolditalic(paste(theta[pi]))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V5/chrx$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

d <- read.table("/home/morpheus/reseq/FST/exons_50k_cov.bed")
e <- read.table("/home/morpheus/reseq/FST/chrx_rep_50k_cov.bed")
b <- read.table("/home/morpheus/reseq/FST/deseq_dac.txt",header=T)
b[which(b$Chr=="NC_047627.1"),]-> ChrX
b[which(b$qval<=0.1),]->B
d[which(d$V1=="NC_047627.1"),]->D
par(mar=c(3,5,2,5))
plot(e$V3,e$V7,type="l",axes=FALSE,ylab="",main="Repeat Density in 50 Kb window",xlab="",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Repeat Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(ChrX$Start+ChrX$End)/2 -> ChrX$mean
ChrX$End-ChrX$Start -> ChrX$length
plot(ChrX$mean,ChrX$log_fold_change,pch=20,cex=log10(ChrX$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=3,font=2,col="red")

par(mar=c(4,5,2,5))
plot(D$V3,D$V7,type="l",axes=FALSE,main="Exon Density in 50 Kb window",ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=1.75,cex.main=1.75,lwd=3)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=1.5,font.axis=2)
mtext("Exon Density",side=2,line=3,font=2)
box()
par(new=TRUE)
(ChrX$Start+ChrX$End)/2 -> ChrX$mean
ChrX$End-ChrX$Start -> ChrX$length
plot(ChrX$mean,ChrX$log_fold_change,pch=20,cex=log10(ChrX$length),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=1.5,font.axis=2,col.axis="red")
mtext("-log2FC",side=4,line=3,font=2,col="red")
dev.off()


