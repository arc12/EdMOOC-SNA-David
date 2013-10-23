library("tm")

doc <- Corpus(VectorSource(data.frame$store))
summary(doc)

doc.corpus <-tm_map(doc, removeWords, stopwords("english")) #removes stopwords
doc.corpus <-tm_map(doc.corpus, stripWhitespace) #removes stopwords
doc.corpus <-tm_map(doc.corpus, tolower)
doc.corpus <-tm_map(doc.corpus, removeNumbers)
doc.corpus <-tm_map(doc.corpus, removePunctuation)

library(SnowballC)

doc.corpus <- tm_map(doc.corpus, stemDocument) #TO STEM OR NOT TO STEM

TDM <- TermDocumentMatrix(doc.corpus)
TDM
inspect(TDM[1:10,1:10])

findFreqTerms(TDM, 40)
findAssocs(TDM, "think", 0.8)

TDM.common = removeSparseTerms(TDM, 0.9)
dim(TDM)
dim(TDM.common)


library(slam)

TDM.dense <- as.matrix(TDM.common)
TDM.dense

object.size(TDM.common)
object.size(TDM.dense)

library(reshape2)
TDM.dense = melt(TDM.dense, value.name = "count")
head(TDM.dense)

library(ggplot2)

ggplot(TDM.dense, aes(x = Docs, y = Terms, fill = count)) +
  geom_tile(colour = "white") +
  scale_fill_gradient(high="#FF0000" , low="#FFFFFF")+
  ylab("") +
  theme(panel.background = element_blank()) +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())