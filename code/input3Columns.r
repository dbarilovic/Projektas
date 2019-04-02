#!/usr/bin/env Rscript

dir.create(file.path("../output", "columns"))
setwd("../output/filtered/")
filelist = list.files(path=".", pattern = "*.filtered$") # failu pavadinimu lis$
for(i in 1:length(filelist)){
setwd("../filtered/")
table <- (read.table(filelist[i]))
columns <- c(1:3)
reqColumns <- (table[,columns])
print(reqColumns)
finalName <- (paste(filelist[i],"columns", sep="."))
setwd("../columns")
file.create(finalName)
write.table(reqColumns, finalName, sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}


