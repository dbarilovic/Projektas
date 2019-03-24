#!/usr/bin/env Rscript

setwd("../output/")
patternLines <- readLines("pattern.txt")
filelist = list.files(path="../output/columns/", pattern = ".*.columns") # failu pavadinimu listas
filelistFull = list.files(path="../input/", pattern = "*.filtered") # failu pavadinimu listas
setwd("../output/columns")
count <- 0;
for (name in filelist) {
count <- count +1;
 fileCol <- readLines(name)
fullFileNames <- filelistFull[count]
setwd("../../input")
fullFiles <- read.delim(fullFileNames)
setwd("../output/final")
final<-(paste(name,"final", sep="."))
file.create(final)
#print(fullFileNames)
setwd("../output/columns")
write.table(fullFiles[match(patternLines, fileCol),],final,sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}
