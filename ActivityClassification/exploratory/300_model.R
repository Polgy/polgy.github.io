#require(e1071)
require(caret)
require(doParallel)

#mySVM <- svm( calsse ~ . , data = uTrain)


ctrl <- trainControl(method = "cv", savePred=T, classProb=T)



 cl <- makeCluster(detectCores())
 registerDoParallel(cl)

system.time(trinedsvm <- train( fctClasse~. , data=sTrain,
						method = "svmRadial",
						tunelength = 9,
						preProc=c("center", "scale"),
						metric = "ROC",
						trControl = ctrl
				)
)

tg2 <- expand.grid( sigma = c(0.1, 1, 5), C = c(1, 10))
ctrl <- trainControl(method = "cv", savePred=T, classProb=T)
system.time(
	csvm2 <- train( fctClasse~. , data=sTrain,
			method = "svmRadial",
			#tunelength = 9,
			tuneGrid = tg2,
			#preProc=c("center", "scale"),
			metric = "ROC",
			trControl = ctrl
		)
)

g3 <- expand.grid( sigma = c(0.3, .6, .9, 2), C = c(10))
ctrl <- trainControl(method = "cv", savePred=T, classProb=T)
system.time(
	csvm3 <- train( fctClasse~. , data=sTrain,
			method = "svmRadial",
			#tunelength = 9,
			tuneGrid = tg2,
			#preProc=c("center", "scale"),
			metric = "ROC",
			trControl = ctrl
		)
)

stopCluster(cl)
