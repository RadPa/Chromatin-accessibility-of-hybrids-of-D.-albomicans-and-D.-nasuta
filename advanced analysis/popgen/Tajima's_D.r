jpeg("Tajima's_D.jpeg",width=15,height=10,units='in',res=700)
par(mfrow=c(5,1))
par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047627.1"),]-> chrx
plot(chrx$V3,chrx$V9/chrx$V14,type="n",main=expression(bold("Chr X") ~ bolditalic(paste("Tajima's D"))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(-0.025,0.025),xlab="", ylab=expression(bolditalic(paste("Tajima's D"))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047627.1"),]-> chrx
lines(chrx$V3,chrx$V9/chrx$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047628.1"),]-> chr2l
plot(chr2l$V3,chr2l$V9/chr2l$V14,type="n",main=expression(bold("Chr 2L") ~ bolditalic(paste("Tajima's D"))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(-0.03,0.025),xlab="", ylab=expression(bolditalic(paste("Tajima's D"))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047628.1"),]-> chr2l
lines(chr2l$V3,chr2l$V9/chr2l$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047629.1"),]-> chr3
plot(chr3$V3,chr3$V9/chr3$V14,type="n",main=expression(bold("Chr 3") ~ bolditalic(paste("Tajima's D"))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(-0.0005,0.003),xlab="", ylab=expression(bolditalic(paste("Tajima's D"))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047629.1"),]-> chr3
lines(chr3$V3,chr3$V9/chr3$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047630.1"),]-> chr4
plot(chr4$V3,chr4$V9/chr4$V14,type="n",main=expression(bold("Chr 4") ~ bolditalic(paste("Tajima's D"))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(-0.006,0.003),xlab="", ylab=expression(bolditalic(paste("Tajima's D"))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V9/chr4$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

par(mar=c(2,5,2,2))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047631.1"),]-> chr2r
plot(chr2r$V3,chr2r$V9/chr2r$V14,type="n",main=expression(bold("Chr 2R") ~ bolditalic(paste("Tajima's D"))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2, ylim=c(-0.01,0.005),xlab="", ylab=expression(bolditalic(paste("Tajima's D"))))
a <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3)
a <- read.table("ALB_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3,lty=2)
a <- read.table("ALB_CHN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3,lty=3)
a <- read.table("ALB_TAI_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3,lty=4)
a <- read.table("NAS_IND_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3,col="red")
a <- read.table("NAS_FRA_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3,col="red",lty=2)
a <- read.table("NAS_KEN_theta.50_50.gz.pestPG")
a[which(a$V2=="NC_047631.1"),]-> chr2r
lines(chr2r$V3,chr2r$V9/chr2r$V14,type="l",lwd=3,col="red",lty=3)
legend("topright",legend=c("D. albomicans","D. nasuta"),fill=c("black","red"),text.font=4,cex=1.2)
legend("top",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,ncol=7,cex=1.2,border=FALSE)

dev.off()

