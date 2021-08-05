library(topGO) 

tmp <- read.delim("nfr.tes.des.genelist")  

geneList <- tmp$pvalue 

names(geneList) <- tmp$Genes 

geneList[is.na(geneList)] <- 1 #replaces NA with 1, as the unaccessible/unexpressed genes are represented as  

#If the data has NA, expected value in resultKS/Fisher will be NA 

geneID2GO <- readMappings("Dalb-GO.txt") 

str(head(geneID2GO)) 

GOdata <- new("topGOdata",  

ontology = "BP", 

allGenes = geneList, 

geneSelectionFun =function(x)x, 

nodeSize = 5,#prune the GO hierarchy from the terms which have less than 5 annotated genes 

annot = annFUN.gene2GO, 

gene2GO = geneID2GO) 

  

#Building most specific GOs ..... 

#( 752 GO terms found. ) 

#Build GO DAG topology .......... 

#( 2229 GO terms and 4544 relations. ) 

#Annotating nodes ............... 

#( 2132 genes annotated to the GO terms. ) 

  

#Kolmogorov-Smirnov testing 

resultKS <- runTest(GOdata, 

algorithn = "weight01", 

statistic = "ks") 

#-- Weight01 Algorithm --  

  

#the algorithm is scoring 840 nontrivial nodes 

#parameters:  

#test statistic: ks 

#score order: increasing 

  

#Level 14: 1 nodes to be scored (0 eliminated genes) 

  

#Level 1: 1 nodes to be scored (2114 eliminated genes) 

  

tab <- GenTable(GOdata,  

raw.p.value = resultKS, 

topNodes = length(resultKS@score), 

numChar = 120) 

  

results.ks <- runTest(GOdata, algorithm = "classic", statistic = "ks") 

goEnrichment <- GenTable( 

  GOdata, 

  KS = results.ks, 

  orderBy = "KS", 

  topNodes = 100, 

  numChar = 99)  

goEnrichment$KS <- as.numeric(goEnrichment$KS) 

goEnrichment <- goEnrichment[goEnrichment$KS < 0.05,] # filter terms for KS p<0.05 

goEnrichment <- goEnrichment[,c("GO.ID","Term","KS")] 

#goEnrichment 

  

ntop <- 30 

ggdata <- goEnrichment[1:ntop,] 

ggdata$Term <- factor(ggdata$Term, levels = rev(ggdata$Term)) # fixes order 

gg1 <- ggplot(ggdata, 

  aes(x = Term, y = -log10(KS), size = -log10(KS), fill = -log10(KS))) + 

  

  expand_limits(y = 1) + 

  geom_point(shape = 21) + 

  scale_size(range = c(2.5,12.5)) + 

  scale_fill_continuous(low = 'royalblue', high = 'red4') + 

  

  xlab('') + ylab('Enrichment score') + 

  labs( 

    title = 'GO Biological processes', 

    subtitle = 'Top 30 terms ordered by Kolmogorov-Smirnov p-value', 

    caption = 'Cut-off lines drawn at equivalents of p=0.05, p=0.01, p=0.001') + 

  

  geom_hline(yintercept = c(-log10(0.05), -log10(0.01), -log10(0.001)), 

    linetype = c("dotted", "longdash", "solid"), 

    colour = c("black", "black", "black"), 

    size = c(0.5, 1.5, 3)) + 

  

  theme_bw(base_size = 24) + 

  theme( 

    legend.position = 'right', 

    legend.background = element_rect(), 

    plot.title = element_text(angle = 0, size = 16, face = 'bold', vjust = 1), 

    plot.subtitle = element_text(angle = 0, size = 14, face = 'bold', vjust = 1), 

    plot.caption = element_text(angle = 0, size = 12, face = 'bold', vjust = 1), 

  

    axis.text.x = element_text(angle = 0, size = 12, face = 'bold', hjust = 1.10), 

    axis.text.y = element_text(angle = 0, size = 12, face = 'bold', vjust = 0.5), 

    axis.title = element_text(size = 12, face = 'bold'), 

    axis.title.x = element_text(size = 12, face = 'bold'), 

    axis.title.y = element_text(size = 12, face = 'bold'), 

    axis.line = element_line(colour = 'black'), 

  

    #Legend 

    legend.key = element_blank(), # removes the border 

    legend.key.size = unit(1, "cm"), # Sets overall area/size of the legend 

    legend.text = element_text(size = 14, face = "bold"), # Text size 

    title = element_text(size = 14, face = "bold")) + 

  

  coord_flip() 

gg1 

#Enrichment among significant DE genes 

GOdata <- new("topGOdata",  

ontology = "MF", 

allGenes = geneList, 

geneSelectionFun =function(x) (x < 0.05),#geneSel =topDiffGenes 

annot = annFUN.gene2GO, 

gene2GO = geneID2GO) 

# Test for enrichment using Fisher's Exact Test 

resultFisher <- runTest(GOdata,  

    algorithm = "elim",  

    statistic = "fisher") 

  

goEnrichment <- GenTable( 

  GOdata, 

  Fisher = resultFisher, 

  orderBy = "Fisher", 

  topNodes = 100, 

  numChar = 99) 

goEnrichment$Fisher <- as.numeric(goEnrichment$Fisher) 

goEnrichment <- goEnrichment[goEnrichment$Fisher < 0.05,] # filter terms for Fisher p<0.05 

goEnrichment <- goEnrichment[,c("GO.ID","Term","Fisher")] 

head(goEnrichment) 

ntop <- 30 

ggdata <- goEnrichment[1:ntop,] 

ggdata$Term <- factor(ggdata$Term, levels = rev(ggdata$Term)) # fixes order 

gg1 <- ggplot(ggdata, 

  aes(x = Term, y = -log10(Fisher), size = -log10(Fisher), fill = -log10(Fisher))) + 

  

  expand_limits(y = 1) + 

  geom_point(shape = 21) + 

  scale_size(range = c(2.5,12.5)) + 

  scale_fill_continuous(low = 'royalblue', high = 'red4') + 

  

  xlab('') + ylab('Enrichment score') + 

  labs( 

    title = 'GO Cellular Component', 

    subtitle = 'Top 30 terms ordered by Fisher Exact p-value', 

    caption = 'Cut-off lines drawn at equivalents of p=0.05, p=0.01, p=0.001') + 

  

  geom_hline(yintercept = c(-log10(0.05), -log10(0.01), -log10(0.001)), 

    linetype = c("dotted", "longdash", "solid"), 

    colour = c("black", "black", "black"), 

    size = c(0.5, 1.0, 1.0)) + 

  

  theme_bw(base_size = 14) + 

  theme( 

    legend.position = 'right', 

    legend.background = element_rect(), 

    plot.title = element_text(angle = 0, size = 14, face = 'bold', vjust = 1), 

    plot.subtitle = element_text(angle = 0, size = 12, face = 'bold', vjust = 1), 

    plot.caption = element_text(angle = 0, size = 10, face = 'bold', vjust = 1), 

  

    axis.text.x = element_text(angle = 0, size = 10, face = 'bold', hjust = 1.10), 

    axis.text.y = element_text(angle = 0, size = 10, face = 'bold', vjust = 0.5), 

    axis.title = element_text(size = 10, face = 'bold'), 

    axis.title.x = element_text(size = 10, face = 'bold'), 

    axis.title.y = element_text(size = 10, face = 'bold'), 

    axis.line = element_line(colour = 'black'), 

  

    #Legend 

    legend.key = element_blank(), # removes the border 

    legend.key.size = unit(1, "cm"), # Sets overall area/size of the legend 

    legend.text = element_text(size = 12, face = "bold"), # Text size 

    title = element_text(size = 12, face = "bold")) + 

  

  coord_flip() 

tiff("FE-CC.tiff", width = 720, height = 600, units = "px", pointsize = 15) 

gg1 

dev.off() 

 
