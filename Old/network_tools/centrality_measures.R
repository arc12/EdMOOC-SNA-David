#A bunch of test things I did to get stuff in the data base. I did things 1 at a time to check
#they were right, but as a result this is very messy,should use sapply but lots of for loops because I was tired.

#TODO: use igraph to produce a pretty report about IDS and who is important. Check out Adams Knitr work
#TODO create a graph with attributes
bm_df <- data.frame(betweeness_measures=character(),
                    table=character(),
                    hash=character(),
                      stringsAsFactors=FALSE)


dm_df <- data.frame(betweeness_measures=character(),
                    user=character(),
                    table=character(),
                    hash=character(),
                    stringsAsFactors=FALSE)


library("RMySQL")
library("igraph")

top_degrees = list()
top_bm = list()


for (loop in (1:nrow(settings.databases)))
{
    
    db<-settings.databases[loop,]$forum
    gen<-settings.databases[loop,]$general
    hash<-settings.databases[loop,]$hash
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
  bm_df0<-as.data.frame(betweeness_measures)
  bm_df0$table <- gen
  bm_df0$hash <- hash
  bm_df0<-data.frame(rownames(bm_df0),bm_df0)  
  colnames(bm_df0)[1]="user"
  bm_df <-rbind(bm_df0,bm_df)  
  
  #bm_top20 <- betweeness_measures[1:5]
  degree_measures<-sort(degree(iMrow), decreasing = TRUE)
  dm_df0<-as.data.frame(degree_measures)
  dm_df0$table <- gen
  dm_df0$hash <- hash
  dm_df0<-data.frame(rownames(dm_df0),dm_df0)  
  colnames(dm_df0)[1]="user"
  dm_df <-rbind(dm_df0,dm_df)  
    
 #de_top20 <- degree_measures[1:5]
  
 # top_bm[[i]]<-bm_top20
 # top_degrees[[i]]<-de_top20

  
  }

apply(dm_df,1,todb)


todb<-function(x){
  
  db<-x[['hash']]
  print(db)
 
  mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost')
  query<-paste("update hash_mapping SET forum_degree=",x[['degree_measures']]," WHERE forum_user_id='",db<-x[['user']],"'",sep="" )
  print(query)
  results.user = dbGetQuery(mydb,query)
  dbDisconnect(mydb)
}

for (loop in (1:nrow(bm_df)))
{
  db<-bm_df[loop,]$hash
  print(db)
  
  mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost') 
  query<-paste("update hash_mapping SET forum_bc=",bm_df[loop,]$betweeness_measures," WHERE forum_user_id='",row.names(b<-bm_df[loop,]),"'",sep="" )
  results.user = dbGetQuery(mydb,query)  
  dbDisconnect(mydb)

}

# TODO centrality measures

for (loop in (1:nrow(settings.databases)))
{
  
  print(settings.databases[loop,]$general) 
  db<-settings.databases[loop,]$general
  hash<-settings.databases[loop,]$hash
  forum<-settings.databases[loop,]$forum
  print(db)
  
  mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost')
  #stolen from adam
  query<-paste('
              SELECT m.forum_user_id, u.anon_user_id, u.access_group_id role
              FROM ',db,'.users u, ',hash,'.hash_mapping m,
              ((SELECT m.anon_user_id FROM ',forum,'.forum_comments fc, ',forum,'.forum_posts fp,
              ',hash,'.hash_mapping m WHERE fc.post_id = fp.id AND fc.forum_user_id = m.forum_user_id)
              UNION DISTINCT
              (SELECT m.anon_user_id FROM ',forum,'.forum_posts fp, ',hash,'.hash_mapping m
              WHERE fp.forum_user_id = m.forum_user_id)) i
              WHERE u.anon_user_id =i.anon_user_id AND m.anon_user_id =i.anon_user_id
              ' 
  )
  results.users = dbGetQuery(mydb,query)
  dbDisconnect(mydb)
  print(results.users)
}