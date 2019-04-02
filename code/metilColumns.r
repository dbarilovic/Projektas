#!/usr/bin/env Rscript

dir.create(file.path("../output", "metil"))
setwd("../output/final/")
filelist = list.files(path=".", pattern = "*.final$") # failu pavadinimu listas
for(i in 1:length(filelist)){
setwd("../final/")
table <- (read.table(filelist[i]))
metilColumns <- (table[,5])
print(metilColumns)
finalName <- (paste(filelist[i],"metil", sep="."))
setwd("../metil")
file.create(finalName)
write.table(metilColumns, finalName, sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}

