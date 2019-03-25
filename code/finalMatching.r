  GNU nano 2.7.4                                                                              File: finalMatching.r                                                                                         

#!/usr/bin/env Rscript

setwd("../output")
patternLines <- readLines("pattern.txt")
filelist = list.files(path="columns", pattern = "*.columns$") # failu pavadinimu listas
filelistFull = list.files(path="filtered", pattern = "*.filtered$") # failu pavadinimu listas
#print (filelistFull)
setwd("columns")
count <- 0;
for (name in filelist) {
count <- count +1;
fileCol <- readLines(name)
#       fileCol <-readLines(filelist[1])
fullFileNames <- filelistFull[count]
setwd("../filtered")
fullFiles <- read.table(fullFileNames)
#       fullFiles <- read.delim(filelistFull[1])
setwd("../final")
final<-(paste(name,"final", sep="."))
file.create(final)
setwd("../columns")
write.table(fullFiles[match(patternLines, fileCol),],final,sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
        #print(fullFiles[match(patternLines, fileCol),])

}


