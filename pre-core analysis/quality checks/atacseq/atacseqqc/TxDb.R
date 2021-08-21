#Loading required library
library(GenomicFeatures) 

#Loading gfffile 
gffFile <- ("GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.agat.sort.gff") 

#metadata 

chrominfo <- data.frame(chrom = c('NC_047627.1','NC_047628.1','NC_047629.1','NC_047630.1','NC_047631.1', 'NW_022995738.1','NW_022995739.1','NW_022995740.1','NW_022995741.1','NW_022995742.1', 
'NC_027937.1'), 

                             length=c(33427555, 30772581, 55557198, 3955117, 32236572, 

                             1561104, 5143694, 668949, 1184809, 1322850, 

                             15846), 

                             is_circular=c(FALSE, FALSE, FALSE, FALSE,FALSE, 

                             FALSE, FALSE, FALSE, FALSE,FALSE, 

                             TRUE)) 

                              
metadata <- data.frame(name="https://ftp.ncbi.nlm.nih.gov/genomes/refseq/invertebrate/Drosophila_albomicans/", 

                            value=paste0("https://ftp.ncbi.nlm.nih.gov/genomes/refseq/invertebrate/Drosophila_albomicans/latest_assembly_versions/GCF_009650485.1_drosAlbom15112-1751.03v1/")) 

#creating txdb                             

txdb.dalb <- makeTxDbFromGFF(file=gffFile, organism="Drosophila albomicans", taxonomyId=7291, chrominfo=chrominfo, miRBaseBuild=NA, metadata=metadata) 

      
#saving the db 
saveDb(txdb.dalb, file="txdb_alb.sqlite") 

#load db 
txdb_alb <- loadDb("txdb_alb.sqlite") 
