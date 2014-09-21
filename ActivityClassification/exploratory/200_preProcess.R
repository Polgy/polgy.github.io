require(caret)

#a map of transofrmations
# train -> useful Train -> scaled Train
### converting to data frame for predictions/modeling caret has a proble with 
### data.table
#convert to normal data.frame all data sets
uTrain = data.frame(uTrain)
uCV   = data.frame(uCV)
uTest =  data.frame(uTest)


myTrans <- preProcess(uTrain, method=c("center", "scale"))
pcaPreProc <- preProcess(uTrain, method="pca", thresh=.9)


#manual pre-processing will not be required
#for(col in names(uTest)) {
#  cat(col, ':', mean(uTrain[,col], na.rm = T),'\n')
#  m = mean(uTrain[,col])
#  s = sd(uTrain[,col])
#  uTrain[,col] = scale(uTrain[,col]) 
#}


# no NZV's
# nzv <- nearZeroVar(sTrain, saveMetrics = TRUE)
# nzv[nzv$nzv,]

sTrain <- predict(pcaPreProc, uTrain)
sCV    <- predict(pcaPreProc, uCV)
sTest  <- predict(pcaPreProc, uTest)

#sTrain$classe = train$classe


fctClasse <- as.factor(Train$classe)
levels(fctClasse)
numClasse <- as.numeric(fctClasse)
