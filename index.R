#1)Install mysql and set up tables, set username options
#2)Windows users may have to compile rmysql from source
#3)If you use a self contained MAMP style thing you will need something along the lines of ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock
#4)You will need to stick your twitter API key in the tweet search in functions.R
#5)set the following true or false, if true then set options too

reddit <- TRUE
youtube <- FALSE
twitter <- FALSE
blog <- FALSE

setwd("~/Desktop/RStudio/Personal Corpus/R")
source("settings.R")
source("aquire.R")
source("functions.R")

if (blog == TRUE){
  #blog 
  source("blog_wordpress_mysql.R")
  source("blog_basic_analysis.R")
  source("blog_dendrogram.R")
  mostusedterms <- rownames(mydata.df)
  source("relatedtopicsapi.R")
  source("minerelated.R")
  source("blog_topicmodels.R")
  source("blog_text_similarity.R")
}

if (twitter == TRUE){
  
  twitterMap("paddytherabbit", fileName="paddytherabbit.pdf", nMax=1500)
  source("twitter_authentication.R")
  source("twitter_topics.R")
  source("twitter_termfrequency.R")
  source("twitter_map.R")
}


if (reddit == TRUE){
  generatereddittopics(subreds,"year")
}

if (youtube == TRUE){
  #run the 
}


