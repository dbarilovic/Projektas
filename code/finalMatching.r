        

#!/usr/bin/env Rscript

setwd("../output")
patternLines <- readLines("pattern.txt")
filelist = list.files(path="columns", pattern = "*.columns$") # failu pavadinimu listas
filelistFull = list.files(path="filtered", pattern = "*.filtered$") # failu pavadinimu listas
setwd("columns")
count <- 0;
for (name in filelist) {
count <- count +1;
fileCol <- readLines(name)
fullFileNames <- filelistFull[count]
setwd("../filtered")
fullFiles <- read.table(fullFileNames)
setwd("../final")
final<-(paste(name,"final", sep="."))
file.create(final)
setwd("../columns")
write.table(fullFiles[match(patternLines, fileCol),],final,sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}



