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
