#Loading the libraries
library(edgeR) 

#loading the data 
at <- read.table("/home/radhika/atac/dacc/testes/tes.nfr.fcount", header=F) 
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
keep.exprs <- filterByExpr(d0, group=group) #method 1, doesn't seem to work for me :( or it doesn't believe in removing <>( 
d0 <- d0[keep.exprs,, keep.lib.sizes=FALSE] 
dim(d0)   
cutoff <- 10                           #method 2 worked:) 
drop <- which(apply(cpm(d0), 1, max) < cutoff) 
d <- d0[-drop,]  
dim(d)

sname <- colnames(d0) 
spc <- substr(sname, 1, nchar(sname) - 1) #remove certain chr from integer 
spc 
tiff("pltomds.tiff") 
plotMDS(d0, col = as.numeric(spc)) 
dev.off() 

#design voom transformation  
mm <- model.matrix(~0 + spc) 
tiff("meanvariance10.tiff") 
y <- voom(d0, mm, plot = T) 

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
