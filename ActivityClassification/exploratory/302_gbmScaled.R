# gbm model on non-pca data

 require(doPrallel)
 cl <- makeCluster(detectCores())
 registerDoParallel(cl)

ctrl <- trainControl(
		method = "cv", 
		number = 10,
		repeats = 10
	  )

gbmGrid <- expand.grid (
		interaction.depth = c(1,5,9),
		n.trees = c(10,30, 90, 300, 1000),
		shrinkage = 0.1)


system.time (
  gbmMod <- train (classe ~ . , data = tTrain,
              method = "gbm",
              trControl = ctrl,
              verbose = FALSE,
		  tuneGrid = gbmGrid)
)