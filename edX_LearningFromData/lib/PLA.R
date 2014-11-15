PLA = function(DF, y, max.iter = 1e4 ) {
  X = as.matrix(cbind(1, DF))
  w = c(0,0,0)
  counter = 0
  # Iterate to update the weights until converge.
  N=dim(X)[1]
  
  repeat {
    result = X %*% w
    if (sum(sign(result) == y) == N)
      break()
    idx = sample(which(sign(result) != y), 1)
    w = w + y[idx] * X[idx,]
    counter = counter + 1
    if(counter >= max.iter) 
      break()
  }
  # Return weights and  number of iterations.
  return(list(w = w, counter = counter))
}

predict.PLA = function (pla, newdata) {
  X= data.matrix(cbind(1, newdata))
  sign( X %*% pla$w)
}