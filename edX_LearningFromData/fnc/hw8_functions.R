
getRBF  = function (trnData, Cost=0.01, gamma=1) {
  s.ret = svm( y ~ symmetry + intensity, 
             data=trnData, 
             kernel= 'radial', cost= Cost, gamma=1,
             scale=F)
}

getSvm = function (trnData, Cost=0.01, degree=2) {
  s.ret = svm( y ~ symmetry + intensity, 
         data=trnData, 
         kernel= 'polynomial', degree=degree, cost= Cost, coef0=1, gamma=1,
         scale=F)
}


svm.stats = function (x.svm , trnData, tstData) {
  #cm = confusionMatrix(predict(x.svm), trnData$y)
  
  pred = predict(x.svm, newdata = tstData)
  #C_out = confusionMatrix(tstData$y, pred)
  
  # return stats
  #list(N_sv= dim(x.svm$SV)[1], E_in=(cm$table[1,2]+cm$table[2,1])/sum(cm$table),  E_out= unlist(1-C_out$overall[1]))
  data.frame(N_sv= dim(x.svm$SV)[1], 
       E_in= 1-sum(predict(x.svm)==trnData$y)/dim(trnData)[1],
       E_out=1-sum(pred==tstData$y)/dim(tstData)[1])
}

svm_plot = function (ss, trnDat) {
  library(ggplot2)
  #library(gridExtra)
  
  # titlePiece <- as.character(lambda)
  
  X <<- expand.grid(list(symmetry=seq(-7.5, 0, .01), intensity=seq(0, 0.7, .01) ))
  y <<- predict(ss, newdata = X)
  
  DBplot  <- ggplot(data = X, aes(symmetry, intensity, fill = as.factor(y))) + geom_tile() +
              xlab("symmetry") + ylab("intensity") +
              #scale_fill_discrete(limits = c(-1, 1)) + 
              scale_fill_manual(values = c('lightpink', 'aliceblue')) +
              labs(fill = 'Decision Boundary')
  
  finPlot <- DBplot + #ggtitle(bquote('Training Data: '~lambda == .(titlePiece))) +
              geom_point(data=trnDat, aes(symmetry, intensity, color=y)) +
              #labs(color='y') +
              scale_colour_manual(values = c('red', 'blue')) 
  
  #scale_x_continuous(expand = c(0,0)) +
  #scale_y_continuous(expand = c(0,0))
  
  #print(DBplot)
  #print(finPlot)
  finPlot
}