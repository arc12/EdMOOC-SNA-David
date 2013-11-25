
courseIDs<-c("aiplan","astrobio","criticalthinking","edc","equinenutrition","introphil")

#establish connection to MySQL, loading library. contains coursera DB exports from 2013
source("dbConnect.R")
#helper functions
source("helpers.R")

echo.sql<-TRUE # echo SQL statements
echo.flag<-TRUE #echo R source

## For all SQL here. The wildcard ** is for replacement by vpodata_equine etc.

loginreceiver.sql <- 'SELECT username, COUNT(*) as count
FROM `**` 
WHERE page_url LIKE " https://class.coursera.org/**-001/auth/login_receiver%"
GROUP BY username  ORDER BY count DESC LIMIT 10'
loginrecevier.df<-list.SELECT(db, courseIDs, loginreceiver.sql, echo=echo.sql)

signin.sql <- 'SELECT username, COUNT(*) as count
FROM `**` 
WHERE `from` LIKE "%https://www.coursera.org/account/signin%"
GROUP BY username  ORDER BY count DESC'
signin.df<-list.SELECT(db, courseIDs, signin.sql, echo=echo.sql)

keyCount.sql <- "SELECT `key`, COUNT(*) 
FROM `**`
GROUP BY `key` "
keyCounts.df<-list.SELECT(db, courseIDs, keyCount.sql, echo=echo.sql)

lectureviews.sql <- 'SELECT `from`, COUNT(*) as count
FROM `**`
WHERE `page_url` like "%https://class.coursera.org/**-001/lecture/view?lecture_id%"
GROUP BY `from` 
ORDER BY COUNT DESC'
lectureviews.df<-list.SELECT(db, courseIDs, lectureviews.sql, echo=echo.sql)


topips.sql <- "SELECT `user_ip`, COUNT(*) as count
FROM `**`
GROUP BY `user_ip` 
ORDER BY COUNT DESC
LIMIT 10"
topips.df<-list.SELECT(db, courseIDs, topips.sql, echo=echo.sql)

dbDisconnect(db)


library(knitr);
knit2html('Click stream.Rmd')
