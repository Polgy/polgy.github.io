#317 alternative flow of code

library(e1071)
require(doParallel)

cl <- makeCluster(detectCores())
registerDoParallel(cl)                  

sTrain$Classe = fctClasse

#runs for 3 hours
t0 <- system.time(
  tunedR0 <- tune.svm(
               Classe ~ . , data = sTrain, 
               gamma = 10^(-6:-1), cost = 10^(-1:1), kernel = "radial"
             )
       )

#bad initial choice of parameters

# runs for 3 hours
t1 <- system.time(
	TunedR1 <- tune.svm(Classe  ~ ., data = sTrain,
			kernel = "radial",
			gamma = 10^(1:2), cost = 10^(2:3))
)

t2 <- system.time(
	TunedR2 <- tune.svm(Classe  ~ ., data = sTrain,
			kernel = "radial",
			gamma = 10*c(1,3,9) , cost = 10*c(1,3,9)
			)
)

t3 <- system.time(
	TunedR2 <- tune.svm(Classe  ~ ., data = sTrain,
			kernel = "radial",
			gamma = c(0.1, 1, 5) , cost = 10			)
)

eSVM2 = svm(fctClasse ~ ., data = sTrain, 
            gamma = 0.1, cost = 10, kernel = "radial")