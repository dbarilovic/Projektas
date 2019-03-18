filelist <- list.files(path="./", pattern = "./filtered") #gauname failu pavadinimus
GSMcsv <-read.csv(file = "~/Desktop/Mokslai1/Biomedicina/Projektas/data/meta/sample.csv", sep = ",")[ ,1:1] #gauname GSM kodus

tableCol = c()
for (colNames in GSMcsv){
  tableCol <- c(tableCol, colNames)#gauname stulpeliu pavadinimus is GSM...txt.gz failu
}

tableOne <- as.matrix(read.table(tableCol[1], header=TRUE, sep = "\t",
                  as.is=TRUE))

MetilMatrix = matrix(nrow = length(tableOne), ncol = length(GSMcsv))

colnames(MetilMatrix) <- tableCol

count <- 1;
for (name in filelist) {
  tableOne <- as.matrix(read.table(name, header=TRUE, sep = "\t",
                  as.is=TRUE))
  allMetil_Non <-tableOne[, c(4,5)]
  metilLines <- as.numeric(allMetil_Non[,1]);
  nonMetilLines <-as.numeric(allMetil_Non[,1]);
  sumAll <- sum(metilLines, nonMetilLines);
  metilLines <- metilLines/sumAll;
  nonMetilLines <-nonMetilLines/sumAll;
  count <- count+1;
  for (i in 1:length(nonMetilLines)){
  MetilMatrix[count][i] <- nonMetilLines[i]
  }
}


