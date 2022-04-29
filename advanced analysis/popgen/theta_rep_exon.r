t <- list.files(pattern=".50_50.fst.txt")

for(i in t){
a <- read.table(i,header=T)
a[which(a$region=="NC_047630.1"),]-> chr4
gsub(".50_50.fst.txt","",i)-> A
cbind(A,mean(chr4$Nsites),range(chr4$Nsites))->B
print(B)
}


t <- list.files(pattern=".50_50.fst.txt")

for(i in t){
a <- read.table(i,header=T)
gsub(".50_50.fst.txt","",i)-> A
cbind(A,mean(a$Nsites),range(a$Nsites))->B
print(B)
}

grep "exon" ~/atac/GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.gtf | grep -v "codon" | grep -v "CDS" | awk '{print $1,$4,$5,$10}' | sed 's/"//g' | sed 's/;//g' | sed 's/ /\t/g' > exons.bed
bedtools coverage -a ~/atac/input/fischer/50Kb_window.bed -b exons.bed > exons_50k_cov.bed
a[which(a$region=="NC_047630.1"),]-> chr4
plot(chr4$V3,chr4$V7,type="l",lwd=2)


pdf("theta_rep_exon.pdf",height=20,width=30)
par(mfrow=c(3,1))
c <- read.table("~/reseq/thetas/ALB_IND_theta.50_50.gz.pestPG")
b <- read.table("/home/morpheus/atac/input/circos/deseq2_qval_sig.txt")
a <- read.table("~/reseq/thetas/NAS_IND_theta.50_50.gz.pestPG")
d <- read.table("/home/morpheus/reseq/FST/exons_50k_cov.bed")
e <- read.table("/home/morpheus/reseq/FST/chr4_rep_50k_cov.bed")
a[which(a$V2=="NC_047630.1"),]-> chr4
b[which(b$V1=="chr4"),]-> Chr4
b[which(b$padj<=0.1),]->B
d[which(d$V1=="NC_047630.1"),]->D
par(mar=c(6,9,6,8))
plot(e$V3,e$V7,type="l",axes=FALSE,ylab="",main="Chr4 Repeat Density in 50 Kb window",xlab="Genomic co-ordinates",font.lab=2,cex.lab=3,cex.main=3,lwd=5)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
mtext("Repeat Density",side=2,line=6,cex=2,font=2)
box()
par(new=TRUE)
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2 -> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=2,font.axis=2,col.axis="red")
mtext("-log10FC",side=4,line=6,cex=2,font=2,col="red")

par(mar=c(6,9,6,8))
plot(D$V3,D$V7,type="l",axes=FALSE,main="Chr4 Exon Density in 50 Kb window",ylab="",xlab="Genomic co-ordinates",font.lab=2,cex.lab=3,cex.main=3,lwd=5)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
mtext("Exon Density",side=2,line=6,cex=2,font=2)
box()
par(new=TRUE)
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2 -> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=2,font.axis=2,col.axis="red")

par(mar=c(6,9,6,8))
plot(chr4$V3,chr4$V4/chr4$V14,type="l",axes=FALSE,ylab="",main="Chr4 Waterson's Theta and differential accessible regions",xlab="Genomic co-ordinates",font.lab=2,cex.lab=3,cex.main=3,lwd=5)
axis(1,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
axis(2,col="black",las=1,cex.lab=1.5,font.lab=2,cex.axis=2,font.axis=2)
mtext("Theta (tw)",side=2,line=6,cex=2,font=2)
c[which(c$V2=="NC_047630.1"),]-> chr4
lines(chr4$V3,chr4$V4/chr4$V14,type="l",col="blue",lwd=5)
box()
par(new=TRUE)
(Chr4$V3+Chr4$V2)/2 -> Chr4$V5
Chr4$V3-Chr4$V2 -> Chr4$V6
plot(Chr4$V5,Chr4$V4,pch=20,cex=log10(Chr4$V6),col="red",axes="FALSE",xlab="",ylab="",font.lab=2,cex.lab=2,cex.main=2)
axis(4,col="red",las=1,cex.lab=2,font.lab=2,cex.axis=2,font.axis=2,col.axis="red")
mtext("-log10FC",side=4,line=6,cex=2,font=2,col="red")
legend("topleft", legend=c("D. albomicans (IND)","D. nasuta (IND)"), fill=c("blue","black"),text.font=4,cex=2.5)
dev.off()

