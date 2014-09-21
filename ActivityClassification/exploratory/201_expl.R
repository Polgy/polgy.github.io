#exploratory analysis on traning set

svdTrain = svd(scale(uTrain))
names(uTrain)[order(abs(svdTrain$v[,1]),decreasing=T)[1:4]]
names(uTrain)[order(abs(svdTrain$v[,2]),decreasing=T)[1:4]]
names(uTrain)[order(abs(svdTrain$v[,3]),decreasing=T)[1:4]]
names(uTrain)[order(abs(svdTrain$v[,4]),decreasing=T)[1:4]]

library(RColorBrewer)
mycol= heat.colors(5)
par(mfrow=c(1,2))
plot(svdTrain$u[,1],col=mycol[numClasse],cex=1.3, pch=numClasse)
plot(svdTrain$u[,2],col=mycol[numClasse],cex=1.3, pch=numClasse)