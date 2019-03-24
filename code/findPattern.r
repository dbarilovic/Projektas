#!/usr/bin/env Rscript

setwd("../output/")
file.create("pattern.txt")
setwd("../input/")
tableOne <- (read.delim("GSM2222903_P1_C10_JV_L_25M_ZT32-30376429.bismark_pe.probe_matches.CX_report.txt.filtered", header=FALSE, as.is=TRUE))
filelist = list.files(path="../input/", pattern = ".*.filtered") # failu pavadinimu listas

setwd("../input/")
tmpFile <-read.delim(filelist[1], header=FALSE, as.is=TRUE)
matchedPattern <-tmpFile[, c(1,2,3)]

MetilMatrix = matrix(nrow = length(tmpFile[,1]) , ncol = length(filelist))
setwd("../input/")
for (name in filelist) {
  tmp <- read.delim(name, header=FALSE, as.is=TRUE)
  col3 <-tmpFile[, c(1,2,3)]
  matchedPattern <-unique(rbind(col3, matchedPattern))
}
setwd("../output")
write.table(matchedPattern,"pattern.txt",sep="\t",row.names=FALSE, col.names=FALSE, quote=FALSE)

