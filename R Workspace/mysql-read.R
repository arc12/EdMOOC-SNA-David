library("RMySQL")

mydb = dbConnect(MySQL(), user='KingKongRoot', password='CarBoot', dbname='ed_aiplanfor', host='localhost')
query<-paste('SELECT post_text as store from forum_posts')
data.frame = dbGetQuery(mydb,query)
dbDisconnect(mydb)