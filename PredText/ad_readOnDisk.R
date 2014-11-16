library(tm)
ddir = "H:/datasets/SwiftKey/"
# uses filehash library
corpus = 
  PCorpus(DirSource(ddir), 
          readerControl = list(language="en_US"),
          dbControl = list(dbName = "all_corpus.db", dbType = "DB1")
) 

corpus.t = 
  PCorpus(object , readerControl = list(reader = readerPlain),
  dbControl = list(dbName = "twitt_corpus.db", dbType = "DB1")
		)