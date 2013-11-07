## ****************************************************
## Created: David Sherlock, Cetis, Oct 2013. Based on work by Adam Cooper and Ben Marwick
## This source code was produced for The University of
## Edinburgh DEI as part of their MOOC initiative.
## Computes some basic statistics about forum use.
## ****************************************************

## Chunks intended for use with knitter in the Rmd file.
## Can be used independently of knitr but NB that some config parameters are set in the Rmd

## @knitr INIT

courseIDs<-c("aiplan","astro","crit","edc","equine","intro")
echo.sql<-TRUE # echo SQL statements
echo.flag<-TRUE #echo R source


#establish connection to MySQL, loading library. contains coursera DB exports from 2013
source("../dbConnect.R")
#helper functions
source("../helpers.R")

## For all SQL here. The wildcard ** is for replacement by ed__equine etc.

#Do we want to include the welcome forums? Should we put a flag here?

## @knitr FORUM_COUNT
forumCount.sql <- "SELECT count(id) forums, sum(deleted) forums_deleted, sum(can_post) forums_can_post,
   (SELECT count(1) from **for.forum_subscribe_forums) forums_user_subscriptions
   from **for.forum_forums"
threadCount.sql <- "SELECT count(id) threads, sum(deleted) threads_deleted, sum(is_spam) threads_spam,
   sum(stickied) threads_stickied, sum(instructor_replied) threads_instructor_replied,
   sum(anonymous) threads_anonymous, avg(votes) threads_average_votes, 
   (SELECT count(1) from **for.forum_tags_threads) threads_tags,
   (SELECT count(1) from **for.forum_subscribe_threads) threads_user_subscriptions
   from **for.forum_threads"
postCount.sql <- "SELECT count(id) posts, sum(deleted) posts_deleted, sum(is_spam) posts_spam,
   sum(stickied) posts_stickied, sum(approved) posts_approved, sum(anonymous) posts_anonymous,
   avg(votes) posts_average_votes from **for.forum_posts"
commentCount.sql<-"SELECT count(id) comments, sum(deleted) comments_deleted,
   sum(is_spam) comments_spam, sum(anonymous) comments_anonymous, avg(votes) comments_average_votes
   from **for.forum_comments"
forumCount.df<-tabular.SELECT(db, courseIDs, forumCount.sql, echo=echo.sql)
threadCount.df<-tabular.SELECT(db, courseIDs, threadCount.sql, echo=echo.sql)
postCount.df<-tabular.SELECT(db, courseIDs, postCount.sql, echo=echo.sql)
commentCount.df<-tabular.SELECT(db, courseIDs, commentCount.sql, echo=echo.sql)

## @knitr POST_ANALYSIS
forum_posts.sql <- "select ff.name name, fp.post_text post_text, fp.post_time post_time, fp.forum_user_id forum_user_id FROM **for.forum_forums ff

LEFT  JOIN **for.forum_threads ft ON ff.id = ft.forum_id
LEFT  JOIN **for.forum_posts fp ON fp.thread_id = ft.id

WHERE fp.post_text IS NOT NULL"

forum_posts.df<-list.SELECT(db, courseIDs, forum_posts.sql, echo=echo.sql)

## @knitr PREPARE_TEXT
require(tm)

corpus.list<-list()
dtm.list <-list()
documents.list <-list() 
vocabulary <-list()
word.freqs <-list()
doc.topics <- list()
topic.words <- list()
topic.docs<-list()
topics.labels<-list()
topic.model<-list()
mallet.instances <- list()

# preprocess and put in list
#for(i in 1:length(courseIDs)){
#  
#  corpus.list[[courseIDs[i]]] <- Corpus(VectorSource(forum_posts.df[[i]]$post_text))
#  skipWords <- function(x) removeWords(x, stopwords("english"))
#  funcs <- list(tolower, removePunctuation, removeNumbers, stripWhitespace, skipWords)
#  corpus.list[[courseIDs[i]]] <- tm_map(corpus.list[[courseIDs[i]]] , FUN = tm_reduce, tmFuns = funcs)
#  
#}

#take list and do analysis
#for(i in 1:length(courseIDs)){
#  dtm.list[[courseIDs[i]]] <- DocumentTermMatrix(corpus.list[[courseIDs[i]]], control = 
#                              # limit word lengths
#                              list(wordLengths = c(2,10))) # ,
#}

require(mallet)
#Where is the preprocessing for this? The above stuff isn't used?
for(i in 1:length(courseIDs)){
 
  
  #A list of dataframes
  documents.list[[courseIDs[i]]] <- data.frame(text = forum_posts.df[[i]]$post_text, time = forum_posts.df[[i]]$post_time, name = forum_posts.df[[i]]$name  , id = make.unique(forum_posts.df[[i]]$forum_user_id), stringsAsFactors=FALSE)
 
  #import data into mallet. 
  mallet.instances[[courseIDs[i]]] <- mallet.import(documents.list[[courseIDs[i]]]$id, documents.list[[courseIDs[i]]]$text, "en.txt" )
  
  #number of topics
  n.topics <- 30
  
  ## Create a topic trainer object.
  topic.model[[courseIDs[i]]] <- MalletLDA(n.topics)
  
  ## Load our documents.
  topic.model[[courseIDs[i]]]$loadDocuments(mallet.instances[[courseIDs[i]]])
  
  ## Get the vocabulary, and some statistics about word frequencies.
  vocabulary[[courseIDs[i]]] <- topic.model[[courseIDs[i]]]$getVocabulary()
  word.freqs[[courseIDs[i]]] <- mallet.word.freqs(topic.model[[courseIDs[i]]])
  
  ## Check http://mallet.cs.umass.edu/topics.php for settings
  topic.model[[courseIDs[i]]]$setAlphaOptimization(20, 50)
  topic.model[[courseIDs[i]]]$train(200)
  topic.model[[courseIDs[i]]]$maximize(10)
  
  ## Get the probability of topics in documents and the probability of words in topics.
  ## By default, these functions return raw word counts. Here we want probabilities, 
  ##  so we normalize, and add "smoothing" so that nothing has exactly 0 probability.
 
  #This function returns a matrix with one row for every document and one column for every topic
  doc.topics[[courseIDs[i]]] <- mallet.doc.topics(topic.model[[courseIDs[i]]], smoothed=T, normalized=T)
  
  #This function returns a vector of strings, one for each topic, with the most probable words in that topic separated by spaces.
  topic.words[[courseIDs[i]]] <- mallet.topic.words(topic.model[[courseIDs[i]]], smoothed=T, normalized=T)
  
  # from http://www.cs.princeton.edu/~mimno/R/clustertrees.R
  ## transpose and normalize the doc topics
  topic.docs[[courseIDs[i]]] <- t(doc.topics[[courseIDs[i]]])
  topic.docs[[courseIDs[i]]] <- topic.docs[[courseIDs[i]]] / rowSums(topic.docs[[courseIDs[i]]])
  
  ## Get a vector containing short names for the topics
  topics.labels[[courseIDs[i]]] <- rep("", n.topics)
  for (topic in 1:n.topics) topics.labels[[courseIDs[i]]][topic] <- paste(mallet.top.words(topic.model[[courseIDs[i]]], topic.words[[courseIDs[i]]][topic,], num.top.words=5)$words, collapse=" ")
  # have a look at keywords for each topic
  topics.labels[[courseIDs[i]]]
  
}

#The next bit is not in a loop because it depends on what we want to 
#ask it.. natch..

  # create data.frame with columns as authors and rows as topics
  topic_docs <- data.frame(topic.docs[courseIDs[5]])
  names(topic_docs) <-  documents.list[[courseIDs[5]]]$id
  

  # Here we can pick out an individual user and see what.
  # topics they have been posting too
 
  df1 <- t(topic_docs[,grep("fc1c4306aae418a2bea27e2a3415048b015b3a6b", names(topic_docs))])
  colnames(df1) <- topics.labels[[5]]
 
  require(reshape2)
  topic.proportions.df <- melt(cbind(data.frame(df1),
                                     document=factor(1:nrow(df1))),
                               variable.name="topic",
                               id.vars = "document") 
  #plot for each doc by that author
  require(ggplot2)
  ggplot(topic.proportions.df, aes(topic, value, fill=document)) +
    geom_bar(stat="identity") +
    ylab("proportion") +
    theme(axis.text.x = element_text(angle=90, hjust=1)) +  
    coord_flip() +
    facet_wrap(~ document, ncol=5)
  #
  ## cluster based on shared words
  plot(hclust(dist(topic.words[[5]])), labels=topics.labels[[5]])
  

## We can see how they differ based on something

topic_docs_t <- data.frame(t(topic_docs))
topic_docs_t$thread <- documents.list[[5]]$name
df3 <- aggregate(topic_docs_t, by=list(topic_docs_t$thread), FUN=mean)
df3 <- data.frame(t(df3[-3,-length(df3)]), stringsAsFactors = FALSE)
names(df3) <- c("Assignments"	,"General discussions - week 3"	, "General discussions - week 5" ,	"Introductions" ,	"Questions for course tutors"	, "Questions for course tutors - week 2" ,	"Questions for course tutors - week 3" , 	"Questions for course tutors - week 4" ,	"Questions for course tutors - week 5" , 	"Questions for tutors" , "Study groups" , 	"Technical Feedback", "Week 1" ,	"Week 2" ,"Week 3","Week 4","Week 5",	"Wikibook")
df3 <- df3[-1,]
df3 <- data.frame(apply(df3, 2, as.numeric, as.character))
df3$topic <- 1:n.topics

# which topics differ the most?
df3$diff <- df3[,1] - df3[,2] 
df3[with(df3, order(-abs(diff))), ]

# plot
df3m <- melt(df3[,-20], id = 19)
ggplot(df3m, aes(fill = as.factor(topic), topic, value)) +
  geom_bar(stat="identity") +
  coord_flip()  +
  facet_wrap(~ variable)



#' Calculate similarity matrix 
#' Shows which documents are similar to each other
#' by their proportions of topics. Based on Matt Jockers' method 

library(cluster)
topic_df_dist <-  as.matrix(daisy(t(topic_docs), metric =  "euclidean", stand = TRUE))
# Change row values to zero if less than row minimum plus row standard deviation
# keep only closely related documents and avoid a dense spagetti diagram 
# that's difficult to interpret (hat-tip: http://stackoverflow.com/a/16047196/1036500)
topic_df_dist[ sweep(topic_df_dist, 1, (apply(topic_df_dist,1,min) + apply(topic_df_dist,1,sd) )) > 0 ] <- 0

#find similar authors
km <- kmeans(topic_df_dist, n.topics)
# get names for each cluster
allnames <- vector("list", length = n.topics)
for(i in 1:n.topics){
  allnames[[i]] <- names(km$cluster[km$cluster == i])
} 

# Here's the list of authors by group
allnames


#' Visualize author similarity using force-directed network graphs

#### network diagram using Fruchterman & Reingold algorithm
# static
library(igraph)
g <- as.undirected(graph.adjacency(topic_df_dist))
layout1 <- layout.fruchterman.reingold(g, niter=500)
plot(g, layout=layout1, edge.curved = TRUE, vertex.size = 1,  vertex.color= "grey", edge.arrow.size = 0, vertex.label.dist=0.5, vertex.label = NA)


# interactive in a web browser
devtools::install_github("d3Network", "christophergandrud")
require(d3Network)
d3SimpleNetwork(get.data.frame(g),width = 1500, height = 800, 
                textColour = "orange", linkColour = "red", 
                fontsize = 10, 
                nodeClickColour = "#E34A33", 
                charge = -100, opacity = 0.9, file = "d3net.html")
# find the html file in working directory and open in a web browser

# for Gephi
# this line will export from R and make the file 'g.graphml' 
# in the working directory, ready to open with Gephi
write.graph(g, file="g.graphml", format="graphml") 

## @knitr EXIT
# saves useful data
name<-"Basic Forum Stats"
fname<-paste(name, ".RData", sep="")
metadata<-list(project=basename(getwd()), origin=name, created=date())
save(list=c("metadata", "accessed.df",
            "forumCount.df","threadCount.df","postCount.df","commentCount.df","bushiness.df",
            "orphans.df", "forumTopStruct",
            "posterRoles.df","posterDistS","posterDistT","commenterDistS","commenterDistT",
            "post_commentDist","post_commentDist2"),
     file=fname)
cat(paste("Saved to",fname,"\r\n"))
#end tidily
dbDisconnect(db)

## ***Made available using the The MIT License (MIT)***
#The MIT License (MIT)
#Copyright (c) 2013 Adam Cooper, University of Bolton
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of
#this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#    
#    The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
## ************ end licence ***************
