library("RMySQL")
library("igraph")
library("tm")
library(reshape2)
library(ggplot2)
library(SnowballC)
library(slam)

createheatmap<-function(x){
  
db<-x
print(db)
mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost')
query<-paste('select  post_text from `forum_posts`')
results.text = dbGetQuery(mydb,query)
dbDisconnect(mydb)

doc <- Corpus(VectorSource(results.text$post_text))
summary(doc)

doc.corpus <-tm_map(doc, removeWords, stopwords("english")) #removes stopwords
doc.corpus <-tm_map(doc.corpus, stripWhitespace) #removes stopwords
doc.corpus <-tm_map(doc.corpus, tolower)
doc.corpus <-tm_map(doc.corpus, removeNumbers)
doc.corpus <-tm_map(doc.corpus, removePunctuation)

doc.corpus <- tm_map(doc.corpus, stemDocument) #TO STEM OR NOT TO STEM
TDM <- TermDocumentMatrix(doc.corpus)
inspect(TDM[1:10,1:10])


TDM.common = removeSparseTerms(TDM, 0.8)
dim(TDM)
dim(TDM.common)

TDM.dense <- as.matrix(TDM.common)
TDM.dense

object.size(TDM.common)
object.size(TDM.dense)

TDM.dense = melt(TDM.dense, value.name = "count")
head(TDM.dense)

heatplot <- ggplot(TDM.dense, aes(x = Docs, y = Terms, fill = count)) +
  geom_tile(colour = "white") +
  scale_fill_gradient(high="#FF0000" , low="#FFFFFF")+
  ylab("") +
  theme(panel.background = element_blank()) +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

  ggsave(heatplot,filename=paste("outputs/heat/",x,".png",sep=""))

}

answer<-sapply(settings.databases$forum,  createheatmap)


#TODO Generate stats and create a nice knitr style thing. NATCH
