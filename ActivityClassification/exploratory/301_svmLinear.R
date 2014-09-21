#301 linear kernel in parallel
 cl <- makeCluster(detectCores())
 registerDoParallel(cl)

ctrl <- trainControl(method = "cv", savePred=T, classProb=T)

#model Failed
system.time (
  modsvmLin <- train(fctClasse ~ ., data=sTrain,
		 method = "svmLinear", 
		 trControl = ctrl)
)
