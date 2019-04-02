#!/usr/bin/env Rscript

dir.create(file.path("../output", "nonMetil"))
setwd("../output/final/")
filelist = list.files(path=".", pattern = "*.final$") # failu pavadinimu listas
for(i in 1:length(filelist)){
setwd("../final/")
table <- (read.table(filelist[i]))
nonMetilColumns <- table[,4]
print (nonMetilColumns)
finalName <- (paste(filelist[i],"nonMetil", sep="."))
setwd("../nonMetil")
file.create(finalName)
write.table(nonMetilColumns, finalName, sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}






