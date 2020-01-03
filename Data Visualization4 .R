#correlation plot

library(corrplot)
library(MASS)

str(mtcars)

corrMat <- cor(mtcars)

corrplot(corrMat)

corrplot(corrMat,method='ellipse')

#wordcloud


library(wordcloud)
library(RColorBrewer)


rownames(mtcars)

model_table <- table(rownames(mtcars))

model_table

wordcloud(words=names(model_table),freq=as.numeric(model_table),scale=c(1.25,0.25))

# Change the minimum word frequency



#min.freq - below min.freq word will not be plotted

wordcloud(words = names(model_table),
          freq = as.numeric(model_table),
          scale = c(1, 0.25),
          min.freq = 1)































































