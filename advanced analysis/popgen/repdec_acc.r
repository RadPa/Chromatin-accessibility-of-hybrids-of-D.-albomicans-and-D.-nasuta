bedtools intersect -a ChrX.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > ChrX.rep.dacc.bed
bedtools intersect -a Chr2l.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Chr2l.rep.dacc.bed
bedtools intersect -a Chr3.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Chr3.rep.dacc.bed
bedtools intersect -a Chr4.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Chr4.rep.dacc.bed
bedtools intersect -a Chr2r.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Chr2r.rep.dacc.bed
bedtools intersect -a Un2.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Un2.rep.dacc.bed
bedtools intersect -a Un3.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Un3.rep.dacc.bed
bedtools intersect -a Un4.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Un4.rep.dacc.bed
bedtools intersect -a Un5.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4}' | sed 's/ /\t/g' > Un5.rep.dacc.bed


read.table(file="ChrX.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./ChrX.rep.dacc.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="ChrX_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Chr2l.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Chr2l.rep.dacc.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Chr2l_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Chr3.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Chr3.rep.dacc.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Chr3_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Chr4.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Chr4.rep.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Chr4_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Chr2r.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Chr2r.rep.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Chr2r_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Un2.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Un2.rep.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Un2_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Un3.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Un3.rep.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Un3_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Un4.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Un4.rep.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Un4_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

read.table(file="Un5.rep.dacc.bed",header=FALSE) -> rc
as.data.frame(aggregate(rc$V4,list(rc$V5),sum))-> aggr_rc
data.frame(logFC=aggr_rc$x,Rep_class=aggr_rc$Group.1,chr=sapply(strsplit(sapply(strsplit("./Un5.rep.bed","[/]"), `[`, 2),"[.]"),`[`,1))->X
write.table(file="Un5_dacc.txt",X,row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE,append=TRUE)

cat *_dacc.txt > All_dacc.txt

data.frame2matrix = function(data, rowtitle, coltitle, datatitle, 
                             rowdecreasing = FALSE, coldecreasing = FALSE,
                             default_value = NA) {

  # check, whether titles exist as columns names in the data.frame data
  if ( (!(rowtitle%in%names(data))) 
       || (!(coltitle%in%names(data))) 
       || (!(datatitle%in%names(data))) ) {
    stop('data.frame2matrix: bad row-, col-, or datatitle.')
  }

  # get number of rows in data
  ndata = dim(data)[1]

  # extract rownames and colnames for the matrix from the data.frame
  rownames = sort(unique(data[[rowtitle]]), decreasing = rowdecreasing)
  nrows = length(rownames)
  colnames = sort(unique(data[[coltitle]]), decreasing = coldecreasing)
  ncols = length(colnames)

  # initialize the matrix
  out_matrix = matrix(NA, 
                      nrow = nrows, ncol = ncols,
                      dimnames=list(rownames, colnames))

  # iterate rows of data
  for (i1 in 1:ndata) {
    # get matrix-row and matrix-column indices for the current data-row
    iR = which(rownames==data[[rowtitle]][i1])
    iC = which(colnames==data[[coltitle]][i1])

    # throw an error if the matrix entry (iR,iC) is already filled.
    if (!is.na(out_matrix[iR, iC])) stop('data.frame2matrix: double entry in data.frame')
    out_matrix[iR, iC] = data[[datatitle]][i1]
  }

  # set empty matrix entries to the default value
  out_matrix[is.na(out_matrix)] = default_value

  # return matrix
  return(out_matrix)

}

read.table(file="All_dacc.txt",header=FALSE)->M

myMatrix = data.frame2matrix(M, 'V2', 'V3', 'V1')
myMatrix[is.na(myMatrix)] <- 0

rep_col <- c("blue","red","black","brown","cyan","hotpink","darkolivegreen","orange2","khaki","gray50")

pdf("All_chr_repden.pdf",height=12,width=15)
par(mar = c(15,6.1, 3.1, 3.1),xpd=TRUE)
boxplot(myMatrix, col=rep_col, xlab="Chromosome",ylab="-log2 fold change",font.lab=2,font.axis=2)
legend("bottom", inset=c(0,-0.25),legend=c(gsub("_"," ",row.names(myMatrix))),fill=rep_col,ncol = 5, border=NA,box.lty=2)
box()
dev.off()

#########################

bedtools intersect -a ChrX.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"ChrX"}' | sed 's/ /\t/g' > ChrX_rep_acc.txt
bedtools intersect -a Chr2l.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Chr2l"}' | sed 's/ /\t/g' > Chr2l_rep_acc.txt
bedtools intersect -a Chr3.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Chr3"}' | sed 's/ /\t/g' > Chr3_rep_acc.txt
bedtools intersect -a Chr4.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Chr4"}' | sed 's/ /\t/g' > Chr4_rep_acc.txt
bedtools intersect -a Chr2r.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Chr2r"}' | sed 's/ /\t/g' > Chr2r_rep_acc.txt
bedtools intersect -a Un1.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Un1"}' | sed 's/ /\t/g' > Un1_rep_acc.txt
bedtools intersect -a Un2.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Un2"}' | sed 's/ /\t/g' > Un2_rep_acc.txt
bedtools intersect -a Un3.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Un3"}' | sed 's/ /\t/g' > Un3_rep_acc.txt
bedtools intersect -a Un4.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Un4"}' | sed 's/ /\t/g' > Un4_rep_acc.txt
 bedtools intersect -a Un5.rep.bed -b deseq2_qval_sig.txt -wb | awk '{print $1,$2,$3,$8,$4,"Un5"}' | sed 's/ /\t/g' > Un5_rep_acc.txt

cat *_rep_acc.txt > All_rep_acc.txt

a <- read.table("All_rep_acc.txt",header=T)
library(ggplot2)
pdf("Rep_dacc_violin.pdf",width=12,height=9)
ggplot(a,aes(x=Chr~rep, y=fc, fill=rep)) + geom_violin(trim=FALSE,draw_quantiles=c(0.5)) + facet_grid(~Chr, scale="free") + labs(title="Repeat class differential accessibility",x="Chromosome",y="-log2(Fold change)",fill="Repeat Class")
dev.off()

a <- read.table("All_rep_acc.txt",header=T)
library(ggplot2)
pdf("Rep_dacc_violin_boxplot.pdf",width=11,height=6)
ggplot(a,aes(x=rep, y=fc, fill=rep)) + geom_violin(trim=FALSE,draw_quantiles=c(0.5)) + geom_boxplot(width=0.3) + facet_grid(~Chr, scale="free") + labs(title="Repeat class differential accessibility",x="Chromosome",y="-log2(Fold change)",fill="Repeat Class") + theme(axis.text.x = element_text(face="bold",angle = 65,hjust=1))
dev.off()

a <- read.table("All_rep_acc.txt",header=T)
library(ggplot2)
jpeg("Rep_dacc_violin_boxplot.jpeg",width=8000,height=3000,res=700)
ggplot(a,aes(x=rep, y=fc, fill=rep)) + geom_violin(trim=FALSE,draw_quantiles=c(0.5)) + geom_boxplot(width=0.3) + facet_grid(~Chr, scale="free") + labs(title="Repeat class differential accessibility",x="Chromosome",y="-log2(Fold change)",fill="Repeat Class") + theme(axis.text.x = element_text(face="bold",angle = 65,hjust=1))
dev.off()


ggplot(a,aes(x=V6, y=V4, fill=V5)) + geom_violin(trim=FALSE) + facet_wrap(~V6, scale="free")
ggplot(a,aes(x=V6, y=V4, fill=V5)) + geom_violin(trim=FALSE) + facet_grid(~V6, scale="free")
