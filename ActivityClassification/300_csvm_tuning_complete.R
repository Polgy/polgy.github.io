if (!file.exists("mod/csvm3.save")) {
  require(caret)
  require(doParallel)
  
  ctrl <- trainControl(method = "cv", savePred=T, classProb=T)
  
  cl <- makeCluster(detectCores())
  registerDoParallel(cl)
  
  tg3 <- expand.grid( sigma = c(0.3, .6, .9, 2), C = c(5, 10, 15))
  t3 <- system.time(
    csvm3 <- train( fctClasse~. , data=sTrain,
                    method = "svmRadial",
                    #tunelength = 9,
                    tuneGrid = tg3,
                    #preProc=c("center", "scale"),
                    metric = "ROC",
                    trControl = ctrl
    )
  )
  save(csvm3, file="mod/csvm3.save")
} 
else {
  load("mod/csvm3.save")}


if (!file.exists("mod/csvm4.save")) {
  require(caret)
  require(doParallel)
  
  ctrl <- trainControl(method = "cv", savePred=T, classProb=T)
  
  cl <- makeCluster(detectCores())
  registerDoParallel(cl)
  
  tg4 <- expand.grid( sigma = c(3,5), C = c(5))
  t4 <- system.time(
    csvm4 <- train( fctClasse~. , data=sTrain,
                    method = "svmRadial",
                    #tunelength = 9,
                    tuneGrid = tg4,
                    #preProc=c("center", "scale"),
                    #metric = "ROC",
                    trControl = ctrl
    )
  )
  save(csvm4, file="mod/csvm4.save")
} 
else {
  load("mod/csvm4.save")
}

if (!file.exists("mod/csvm5.save")) {
  require(caret)
  require(doParallel)
  
  ctrl <- trainControl(method = "cv", savePred=T, classProb=T)
  
  cl <- makeCluster(detectCores())
  registerDoParallel(cl)
  
  tg5 <- expand.grid( sigma = c(.1, 1, 2,3,5), C = c(1,5,10))
  t5 <- system.time(
    csvm5 <- train( fctClasse~. , data=sTrain,
                    method = "svmRadial",
                    #tunelength = 9,
                    tuneGrid = tg5,
                    #preProc=c("center", "scale"),
                    #metric = "ROC",
                    trControl = ctrl
    )
  )
  save(csvm5, file="mod/csvm5.save")
} 
else {
  load("mod/csvm5.save")
}
