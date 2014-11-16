library(tm)
ddir = "H:/datasets/SwiftKey/"
corpus = Corpus(DirSource(ddir), readerControl = list(language="en_US"))
