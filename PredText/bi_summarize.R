corpus=tm_map(corpus, removeWords,  stopwords("english")) #stop words removal??
corpus=tm_map(corpus, content_transformer(tolower))


 dtm <- DocumentTermMatrix(corpus[3], 
                 control=list(wordLengths=c(1, Inf),
                 bounds=list(global=c(floor(length(corpus[[3]]$content)*0.05), Inf))))