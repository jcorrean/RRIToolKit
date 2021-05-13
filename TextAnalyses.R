library(readxl)
texts <- read_excel("Bilder/Documents/PaperOtoFelipe/RawDataRRI.xlsx", 
                                                 sheet = "Raw Full Text")
tags <- read_excel("Bilder/Documents/PaperOtoFelipe/RawDataRRI.xlsx", 
                                                         sheet = "Raw UpperTags")

library(quanteda)
my_corpus <- corpus(texts$Cases_FullText)
mycorpus <- data.frame(summary(my_corpus, n = nrow(texts)))
mycorpus$ID <- tags$ID
mycorpus$Title <- tags$Cases_Title
mycorpus$UpperTags <- tags$Cases_UpperTags
Tags <- data.frame(table(mycorpus$UpperTags))
DTM <- tokens(my_corpus, what = "word", remove_punct = TRUE, remove_symbols = TRUE, remove_numbers = TRUE)
DTM <- dfm(DTM, dfm_remove = c(stopwords("english"), "€", "â", "rri", "™", "|", "ðÿ", "s"))
topfeatures(DTM, 40)
TOPWORDS <- data.frame(topfeatures(DTM, 40))
TOPWORDS$Word <- rownames(TOPWORDS)
DTM[, 1:5]
pave <- as.matrix(DTM[, 1:5])
rownames(pave) <- mycorpus$UpperTags
library(tidytext)
veamos <- tidy(DTM)
names(veamos)[1] <- "From"
names(veamos)[2] <- "To"
veamos$From <- gsub("[^0-9.-]", "", veamos$From)
