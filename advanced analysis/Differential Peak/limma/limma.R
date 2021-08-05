#Loading the libraries
library(edgeR) 

#loading the data 

at <- read.table("/home/radhika/atac/dacc/testes/tes.q2.f1.nfr.fcount", header=F) 

fo <- read.table("/home/radhika/atac/dacc/testes/info.txt", header=T) 

colnames(at) <- c("Chr", "Start", "End", "AAT1", "AAT2","ANT1", "ANT2") 

rownames(at) <- paste0(at$Chr, ":", at$Start, "-", at$End) 

at <- at[,-c(1:3)] 

  

#getting started with limma 

d0 <- DGEList(at) 

group <- as.factor(c("Dalb", "Dalb", "Dnas", "Dnas")) #group information 

d0$samples$group <- group 

d0 <- calcNormFactors(d0) 

d0 

  

#Transformations from the raw-scale 

cpm <- cpm(d0) 

lcpm <- cpm(d0, log=TRUE) 

L <- mean(d0$samples$lib.size) * 1e-6 

M <- median(d0$samples$lib.size) * 1e-6 

c(L, M) 

summary(lcpm) 

  

#removing lowly expressed or accessible region, we are not going to use it 

table(rowSums(d0$counts>=10)==4) 

# FALSE TRUE 

# 11 30948 

  

keep.exprs <- filterByExpr(d0, group=group) #method 1, doesn't seem to work for me :( or it doesn't believe in removing <>( 

d0 <- d0[keep.exprs,, keep.lib.sizes=FALSE] 

dim(d0) 

#[1] 30959     4 

  

cutoff <- 10                           #method 2 worked:) 

drop <- which(apply(cpm(d0), 1, max) < cutoff) 

d <- d0[-drop,]  

dim(d) 

#[1] 30347     4 

  

sname <- colnames(d0) 

spc <- substr(sname, 1, nchar(sname) - 1) #remove certain chr from integer 

spc 

  

tiff("pltomds.tiff") 

plotMDS(d0, col = as.numeric(spc)) 

#Warning message: 

#In plot.xy(xy, type, ...) : NAs introduced by coercion 

dev.off() 

  

#design voom transformation  

mm <- model.matrix(~0 + spc) 

tiff("meanvariance10.tiff") 

y <- voom(d0, mm, plot = T) 

dev.off() 

  

#fitting linear models 

fit <- lmFit(y, mm) 

head(coef(fit)) 

#constrast DE 

contr <- makeContrasts(spcAAT - spcANT, levels = colnames(coef(fit))) 

contr 

tmp <- contrasts.fit(fit, contr) 

tmp <- eBayes(tmp) 

top.table <- topTable(tmp, sort.by = "P", n = Inf) 

head(top.table, 10) 

length(which(top.table$adj.P.Val < 0.05)) # number of DE genes 

  

write.table(as.data.frame(top.table), 

          file="limma.txt",sep="\t") 

  

lcpm.cutoff <- log2(10/M + 2/L) 

library(RColorBrewer) 

nsamples <- ncol(d0) 

col <- brewer.pal(nsamples, "Paired") 

tiff("logCPM.tiff") 

par(mfrow=c(1,2)) 

plot(density(lcpm[,1]), col=col[1], lwd=2, ylim=c(0,0.50), las=2, main="", xlab="") 

title(main="A. Raw data", xlab="Log-cpm") 

abline(v=lcpm.cutoff, lty=3) 

for (i in 2:nsamples){ 

den <- density(lcpm[,i]) 

lines(den$x, den$y, col=col[i], lwd=2) 

} 

legend("topright", samplenames, text.col=col, bty="n") 

lcpm <- cpm(d0, log=TRUE) 

plot(density(lcpm[,1]), col=col[1], lwd=2, ylim=c(0,0.50), las=2, main="", xlab="") 

title(main="B. Filtered data", xlab="Log-cpm") 

abline(v=lcpm.cutoff, lty=3) 

for (i in 2:nsamples){ 

den <- density(lcpm[,i]) 

lines(den$x, den$y, col=col[i], lwd=2) 

} 

legend("topright", samplenames, text.col=col, bty="n") 

dev.off() 

  

#normalizing gene expression distribution 

d0 <- calcNormFactors(d0, method = "TMM") 

d0$samples$norm.factors 

  

d2 <- d0 

d2$samples$norm.factors <- 1 

d2$counts[,1] <- ceiling(d2$counts[,1]*0.05) 

d2$counts[,2] <- d2$counts[,2]*5 

  

tiff("normalized.tiff") 

par(mfrow=c(1,2)) 

boxplot(lcpm, main="") 

title(main="A. Example: Unnormalised data",ylab="Log-cpm") 

boxplot(d0, main="") 

title(main="B. Example: Normalised data",ylab="Log-cpm") 

dev.off() 
