# expl vis 

install.packages('AppliedPredictiveModeling')
library(AppliedPredictiveModeling)
transparentTheme(trans = .2)

featurePlot(x = sTrain[,1:3], 
		y = fctClasse, 
		plot="pairs", 
		auto.key = list(columns = 5))
