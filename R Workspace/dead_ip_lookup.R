#3If you use a self contained MAMP style thing you will need something along the lines of ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock
options(error = browser)

function1 <- function(x){
 tes<-x
 IPLOOKUP <- paste("http://ipinfo.io/",x,"/json")
 json <- fromJSON(getURL(IPLOOKUP))
 
 mydb = dbConnect(MySQL(), user='KingKongRoot', password='CarBoot', dbname='aiplangen', host='localhost')
 query<-paste('update users set last_accessed_city = "test" WHERE last_access_ip ="',x ,'" ;')
 query
 data.frame = dbGetQuery(mydb,query)
 dbDisconnect(mydb)
 
}   

lapply(data.frame,function1)
apply(data.frame[7],function1)
lapply(data.frame[7], function1)



IPLOOKUP <- "http://ipinfo.io/8.8.8.8/json"
json <- fromJSON(getURL(IPLOOKUP))

library("RMySQL")
library("RCurl")
library("rjson")

mydb = dbConnect(MySQL(), user='KingKongRoot', password='CarBoot', dbname='aiplangen', host='localhost')
query<-paste('SELECT *  from users WHERE last_access_ip != ""')
data.frame = dbGetQuery(mydb,query)
dbDisconnect(mydb)

for(i in data.frame[7]){
  
  IPLOOKUP <- paste("http://ipinfo.io/",i,"/json")
  json <- fromJSON(getURL(IPLOOKUP))
  
  mydb = dbConnect(MySQL(), user='KingKongRoot', password='CarBoot', dbname='aiplangen', host='localhost')
  query<-paste('update users set last_accessed_city = "',json[7] ,'" WHERE last_access_ip ="',i ,'" ;')
  query
  data.frame = dbGetQuery(mydb,query)
  dbDisconnect(mydb)
}