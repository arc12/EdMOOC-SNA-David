
#TODO: use igraph to produce a pretty report about IDS and who is important. Check out Adams Knitr work
#TODO create a graph with attributes

library("RMySQL")
library("igraph")

top_degrees = list()
top_bm = list()


for (i in settings.databases[,1]) {
  
  db<-i
  print(db)
  
  mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost')
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
  bm_top20 <- betweeness_measures[1:5]
  degree_measures<-sort(degree(iMrow), decreasing = TRUE)
  de_top20 <- degree_measures[1:5]
  
  top_bm[[i]]<-bm_top20
  top_degrees[[i]]<-de_top20

  
  }

# TODO centrality measures
for (i in top_bm) {
  print(i);
}