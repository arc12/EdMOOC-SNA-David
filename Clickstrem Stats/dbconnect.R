settings.mysqlusername <- "KingKongRoot"
settings.mysqlpassword <- "CarBoot"

library(RMySQL)
db = dbConnect(MySQL(), user=settings.mysqlusername, password=settings.mysqlpassword, dbname="clickstream", host='localhost')
