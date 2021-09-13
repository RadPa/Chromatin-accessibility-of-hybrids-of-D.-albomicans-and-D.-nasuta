### To create a BSgenome object ###

##For Refseq certain tweeks to get .2bit files of genome##
library(Biostrings)  
### Download GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.gz from 
### https://ftp.ncbi.nlm.nih.gov/genomes/refseq/invertebrate/Drosophila_albomicans/latest_assembly_versions/GCF_009650485.1_drosAlbom15112-1751.03v1/ 
dna <- readDNAStringSet("GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.gz") 

### Check seqnames
current_RefSeqAccn <- unlist(heads(strsplit(names(dna), " ", fixed=TRUE), n=1L)) 

library(GenomeInfoDb) 

chrominfo <- getChromInfoFromNCBI("GCF_009650485.1") 
expected_RefSeqAccn <- chrominfo[ , "RefSeqAccn"]  

#I don't think we need this, as I found them in github 
#stopifnot(setequal(expected_RefSeqAccn, current_RefSeqAccn)) 
### Reorder sequences. 
#dna <- dna[match(expected_RefSeqAccn, current_RefSeqAccn)] 
### Rename sequences. An alternative would be to rename them to 
### chrominfo[ , "SequenceName"] but these names are VERY ugly (e.g. 
### "ScRZk8e_1;HRSCAF=1"). 
#names(dna) <- expected_RefSeqAccn 
names(dna) <- current_RefSeqAccn 
 
### Export as 2bit. 
library(rtracklayer) 
export.2bit(dna, "drosAlbom15112-1751.03v1.sorted.2bit")

#Loading required library
library(BSgenome) 

seed_files <- ("BSgenome.Dalbomicans.NCBI.15112-seed")  
tail(list.files(seed_files, pattern="-seed$"))  
#[1] "BSgenome.Dalbomicans.NCBI.15112-seed"  

dalbv1_seed <- list.files(seed_files, pattern="-seed$", full.names=TRUE)  
cat(readLines(dalbv1_seed), sep="\n")  
#Package: BSgenome.Dalbomicans.dalbv1  
#Title: Full genome sequence for Drosophila albomicans (drosAlbom15112-1751.03v1)  
#Description: Full genome sequence for Drosophila albomicans as provided by NCBI and stored in Biostrings object  
#Version: 1.0.0  
#organism: Drosophila albomicans  
#common_name: D. albomicans  
#provider: NCBI  
#genome: GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.gz  
#release_date: 2019/11/14  
#source_url: https://www.ncbi.nlm.nih.gov/assembly/GCF_009650485.1  
#organism_biocview: Drosophila_albomicans  
#BSgenomeObjname: Dalbomicans  
#circ_seqs: "NC_027937.1"  
#SrcDataFiles: GCF_009650485.1_drosAlbom15112-1751.03v1_genomic.fna.gz https://ftp.ncbi.nlm.nih.gov/genomes/refseq/invertebrate/Drosophila_albomicans/latest_assembly_versions/GCF_009650485.1_drosAlbom15112-1751.03v1/  
#PkgExamples: genome[["NC_027937.1"]]  
#seqs_srcdir: /home/radhika/atac/info-g  
#seqfile_name: drosAlbom15112-1751.03v1.sorted.2bit   

forgeBSgenomeDataPkg("/home/radhika/atac/info-g/BSgenome.Dalbomicans.dalb1-seed")  
#Creating package in ./BSgenome.Dalbomicans.dalbv1   
#Copying '/home/radhika/atac/info-g/drosAlbom15112-1751.03v1.sorted.2bit' to './BSgenome.Dalbomicans.dalbv1/inst/extdata/single_sequences.2bit' ... DONE


## To get a tarball and install BSgenome ###
Open a terminal with a directory containing required files
R CMD build <BSgenome.Dalbomicans.dalbv1> 
R CMD check <BSgenome.Dalbomicans.dalbv1_1.0.0.tar.gz> 
R CMD install <BSgenome.Dalbomicans.dalbv1_1.0.0.tar.gz> 
# custom library ready #
