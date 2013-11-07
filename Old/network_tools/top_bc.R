top_bc_people <- data.frame(anon_id=character(),
                 betweeness=character(),
                 posts=character(), 
                 status=character(), 
                 forum=character(), 
                 stringsAsFactors=FALSE)


for (loop in (1:nrow(settings.databases)))
{
  
  
}

for (loop in (1:nrow(settings.databases)))
{
  print(settings.databases[loop,]$general) 
  db<-settings.databases[loop,]$general
  hash<-settings.databases[loop,]$hash
  print(db)

  mydb = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname=db, host='localhost')
  #stolen from adam
  query<-paste('
              SELECT m.forum_user_id, u.anon_user_id, u.access_group_id role
              FROM ',db,'.users u, ',hash,'.hash_mapping m,
              ((SELECT m.anon_user_id FROM ed_aiplanfor.forum_comments fc, ed_aiplanfor.forum_posts fp,
              ',hash,'.hash_mapping m WHERE fc.post_id = fp.id AND fc.forum_user_id = m.forum_user_id)
              UNION DISTINCT
              (SELECT m.anon_user_id FROM ed_aiplanfor.forum_posts fp, ',hash,'.hash_mapping m
              WHERE fp.forum_user_id = m.forum_user_id)) i
              WHERE u.anon_user_id =i.anon_user_id AND m.anon_user_id =i.anon_user_id
              ' 
               )
  results.users = dbGetQuery(mydb,query)
  dbDisconnect(mydb)
  print(results.users)
}



#nested for loops. Yes I'm going there.
for (i in settings.databases[,1]) {
  #print(i)
  
  
  
  print(top_bm[[i]][1])
}