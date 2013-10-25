library("RMySQL")

mydb = dbConnect(MySQL(), user='KingKongRoot', password='CarBoot', dbname='ed_aiplanfull', host='localhost')
query<-paste('SELECT post_text
FROM course_grades
JOIN hash_mapping 
ON course_grades.anon_user_id = hash_mapping.anon_user_id
JOIN forum_posts
ON hash_mapping.forum_user_id = forum_posts.forum_user_id
WHERE course_grades.normal_grade = "100"

')
data.frame = dbGetQuery(mydb,query)
dbDisconnect(mydb)