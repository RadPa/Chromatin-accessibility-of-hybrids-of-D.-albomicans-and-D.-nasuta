colvec <- c("red","blue","green","yellow","cyan","hotpink","brown")
t <- list.files(pattern=".50_50.gz.pestPG")
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047630.1"),]-> chr4
pdf("all_thetas_line.pdf",width=15,height=10)
plot(chr4$V3,chr4$V4/chr4$V14,type="n",main="Chr4 waterson's theta (tw)",cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2,ylim=c(0,0.008))
colcount=0
for(i in t){
colcount=colcount+1
a <- read.table(i,header=F)
b <- gsub("_theta.50_50.gz.pestPG","",i)
a[which(a$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",lwd=2,col=colvec[colcount])
}
dev.off()


jpeg("all_tw_line.jpeg",width=15,height=10,units='in',res=700)
par(mar=c(4,5,4,4))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047630.1"),]-> chr4
plot(chr4$V3,chr4$V4/chr4$V14,type="n",main=expression(bold(Chr4) ~ bolditalic(paste(theta["w"]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2,ylim=c(0,0.008),xlab="Genomic co-ordinates",ylab=expression(bolditalic(paste(theta["w"]))))
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
legend("topleft",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,cex=1.5)
dev.off()

jpeg("all_tp_line.jpeg",width=15,height=10,units='in',res=700)
par(mar=c(4,5,4,4))
b <- read.table("ALB_JAP_theta.50_50.gz.pestPG")
b[which(b$V2=="NC_047630.1"),]-> chr4
plot(chr4$V3,chr4$V5/chr4$V14,type="n",main=expression(bold(Chr4) ~ bolditalic(paste(theta[pi]))),cex.axis=1.75,cex.lab=1.75,font.axis=4,font.lab=4,cex.main=2,ylim=c(0,0.008),xlab="Genomic co-ordinates",ylab=expression(bolditalic(paste(theta[pi]))))
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
legend("topleft",legend=c("ALB_JAP","ALB_IND","ALB_CHN","ALB_TAI","NAS_IND","NAS_FRA","NAS_KEN"), lty=c(1,2,3,4,1,2,3), col=c("black","black","black","black","red","red","red"), lwd=c(rep(3,7)),text.font=4,cex=1.5)
dev.off()


