#400 get prdictions and print confusion matrix

confusionMatrix(CV$classe, predict(trinedsvm, sCV) ) 