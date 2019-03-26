
#!/usr/bin/env Rscript

setwd("../output/final/")
filelist = list.files(path=".", pattern = "*.final$") # failu pavadinimu listas
for(i in 1:length(filelist)){
setwd("../final/")
table <- (read.table(filelist[i]))
nonMetil <- as.numeric(table[,4])
metil <- as.numeric(table[,5])
final <- metil/(metil+nonMetil)
print(final)
finalName <- (paste(filelist[i],"metil", sep="."))
setwd("../metil")
file.create(finalName)
write.table(final, finalName, sep=" ",row.names=FALSE, col.names=FALSE, quote=FALSE)
}




