#Change the SQL in the function as you want

library("RMySQL")
library("igraph")

creategraphml<-function(x){
  
  db<-x
  print(db)
  mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost')
  query<-paste('select forum_user_id, post_id from `forum_comments`')
  results.graph = dbGetQuery(mydb,query)
  dbDisconnect(mydb)
  
  library("igraph")
  M = as.matrix( table(results.graph) )
  Mrow = M %*% t(M)
  #Mcol = t(M) %*% M
  iMrow = graph.adjacency(Mrow, mode = "undirected")
  E(iMrow)$weight <- count.multiple(iMrow)
  iMrow <- simplify(iMrow)
  filelocation<-paste("outputs/graphml/",x, ".graphml", sep = "")
  write.graph(iMrow, file=filelocation, format="graphml");
  
 }

answer<-sapply(settings.databases$forum,  creategraphml)

#TODO: use igraph to produce a pretty report about IDS and who is important. Check out Adams Knitr work
#TODO create a graph with attributes

mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=settings.databases["aiplan","forum"], host='localhost')
query<-paste('select forum_user_id, post_id from `forum_comments`')
results.graph = dbGetQuery(mydb,query)
dbDisconnect(mydb)

M = as.matrix( table(results.graph) )
Mrow = M %*% t(M)
#Mcol = t(M) %*% M
iMrow = graph.adjacency(Mrow, mode = "undirected")
E(iMrow)$weight <- count.multiple(iMrow) # Remove multiple edges but keep multiplicity
iMrow <- simplify(iMrow) #dont care if we have multiple edges

#lets do some community detection
#using Clique percolation, implementation taken from igraph team (although it's not in igraph.) This seems a little rusty, perhaps we should stick to gephi?

#lets find the 3 classic centrality measures

betweeness_measures<-sort(betweenness(iMrow), decreasing = TRUE)
bm_top20 <- betweeness_measures[1:20]
degree_measures<-sort(degree(iMrow), decreasing = TRUE)