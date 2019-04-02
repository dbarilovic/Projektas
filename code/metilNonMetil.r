#!/usr/bin/env Rscript

dir.create(file.path("../output", "metilNonMetil"))
setwd("../output/final/")
filelist = list.files(path=".", pattern = "*.final$") # failu pavadinimu listas
for(i in 1:length(filelist)){
setwd("../final/")
table <- (read.table(filelist[i]))
metilColumns <- (table[,5])
nonMetilColumns <- (table[4,])
metilNonMetil <- (metilColumns/(metilColumns+nonMetilColumns))
print(metilNonMetil)
finalName <- (paste(filelist[i],"metilNonMetil", sep="."))
setwd("../metilNonMetil")
file.create(finalName)
write.table(metilNonMetil, finalName, sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}


