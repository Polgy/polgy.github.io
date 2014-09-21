require(e1071)
plot(eSVM2, sTrain, PC1 ~ PC2, 
	slice = list(
		PC3=0, PC4=1, PC5 = 3, PC6 = 1, PC7=1,  PC8 = 1, PC9 = 1, 
		PC10 = 1, PC11 = 1, PC12 = 1, PC13=1, PC14 = 1, PC15 = 1,
		PC16=1, PC17=1, PC18=1)
)