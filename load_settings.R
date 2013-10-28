
#Bung your Working directory here
setwd("~/Desktop/Ed/EdMOOC-SNA-David")

#Databases mapping found in settings/databases.csv
# You will need ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock if on mac with MAMP
settings.databases = read.csv("settings/databases.csv",stringsAsFactors=FALSE)
rownames(settings.databases) <- settings.databases[,1]
settings.databases[,1] <- NULL

#Usernames and passwords are in settings/settings.R
source("settings/settings.R")


