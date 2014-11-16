# remove non-unicode

tw <- readLines("en_US/en_US.twitter.txt") 
Encoding(tw) <- "UTF-8" #making sure, though my system is UTF-8
justUTF <-iconv(tw, "UTF-8", "UTF-8",sub='')
rm(tw)
lowtw <- tolower(justUTF)
rm(justUTF)
memes <- data.frame(index= 1:length(lowtw))