pcplot <- ggplot(data=sTrain, aes(x=PC1, y=PC2, color=fctClasse)) + 
		geom_point(alpha=0.2)  + 
scale_color_discrete(name="", breaks=levels(fctClasse)) +
ggtitle("Type Of Excercises In Principal Components")

pcplot


#separation between aa and b?

iAB = fctClasse %in% c("A", "E")

pcplot <- ggplot(data=sTrain[iAB,], aes(x=PC1, y=PC2, color=fctClasse[iAB])) + 
		geom_point(alpha=0.2)  + 
scale_color_discrete(name="", breaks=levels(fctClasse)) +
ggtitle("Type Of Excercises In Principal Components")

pcplot