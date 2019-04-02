#!/usr/bin/env Rscript

dir.create(file.path("../output", "extraInfo"))
setwd("../output/final/")
filelist = list.files(path=".", pattern = "*.final$") # failu pavadinimu listas
setwd("../final/")
table <- (read.table(filelist[1]))
reqColumns <-c(1,2,3,6,7)
nonMetilColumns <- table[,reqColumns]
print (nonMetilColumns)
finalName <- ("extraInfo")
setwd("../extraInfo")
file.create(finalName)
write.table(nonMetilColumns, finalName, sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)


