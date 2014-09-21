library(data.table)
library(caret)
training = fread("H:/datasets/pml-training.csv",na.strings=c("NA","#DIV/0!",""))


inTrain<- createDataPartition(y = training$classe, 
							#outcome data
							p = .75,
							list = FALSE)

Train <- training[as.vector(inTrain)]
CV    <- training[-as.vector(inTrain),]

fieldTypes<-rep("numeric", 160)
fieldTypes[c(2, 5, 6)] = 'character'

testing =  fread("H:/datasets/pml-testing.csv", na.strings=c("NA","#DIV/0!",""))

#determine what we will not be able dont want to use for prediction
usefulFeatures <- apply(testing, 2, function(x) ( sum(is.na(x)) )) != 20
usefulFeatures[c(1,2, 3, 4, 5, 6, 7, 160)] <- FALSE

#fieldTypes<-ifelse(usefulFeatures == TRUE, 'numeric', 'character')

uF= usefulFeatures[usefulFeatures == TRUE]
uTest <- testing[,c(names(uF)), with=FALSE]
uCV   <- CV[,c(names(uF)), with=FALSE]
uTrain <- Train[,c(names(uF)), with=FALSE]


#convert all to numeric,
# set #DIV errors to NA
uTrain <- uTrain[, lapply(.SD, as.numeric)]
#uTrain[, classe := Train$classe]
sum(complete.cases(uTrain))
uCV <- uCV[, lapply(.SD, as.numeric)]
uTest <- uTest[, lapply(.SD, as.numeric)]

#rm(list=c('uF', 'usefulFeatures', 'inTrain', 'fieldTypes')

