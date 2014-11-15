
genDat<- function(N, plotPoints=F) {

  # returns points (x1, x2), labels and true weights
  
	x1=runif(N, -1, 1)
	x2=runif(N, -1, 1)

	num=1:N
	#pnum=sample(num,2)
  
  point1 = runif(2, -1, 1)
	point2 = runif(2, -1, 1)
 
	k=(point2[2]-point1[2])/(point2[1]-point1[1])
  
	w1 = -k
	w2 = 1
	#w0=x1[pnum[1]]*k-x2[pnum[1]]
  w0 = -point1[2] + point1[1]*k 

	#debug c(w0, w1, w2) %*% c(1, x1[pnum[2]], x2[pnum[2]])
	#debug c(w0, w1, w2) %*% c(1, x1[pnum[1]], x2[pnum[1]])


  
	WW=c(w0, w1, w2)
	datM = matrix(cbind(rep(1,N), x1, x2), N, 3,  byrow=F)
	truth = datM %*% WW
	# points(x1[truth>0], x2[truth>0], col='red')

	#truth=truth/abs(truth)
	#truth = ifelse( truth > -1e-7, 1, -1)
  truth=sign(truth)
  truth=ifelse(truth==0,1, truth)
  
	if (plotPoints) {
	  plot(x1,x2, xlim=c(-1,1), ylim=c(-1,1))
	  points(point1[1],point1[2], col="red", pch=19)
	  points(point2[1],point2[2], col="red", pch=19)
    
	  abline(-w0/w2, -w1/w2, col="red")
    
	  points(x1[truth>0], x2[truth>0], col='red')
	  points(x1[truth<0], x2[truth<0], col='green')
	}
  
	
	list(dat=data.frame( x1=x1, x2=x2, y=truth),
       wdat = c(w0, w1, w2)
	)
}

pred.Dat = function (W, newdata) {
  X= data.matrix(cbind(1, newdata))
  sign( X %*% W)
}