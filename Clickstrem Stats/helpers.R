## ****************************************************
## Created: Adam Cooper, Cetis, Oct 2013
## This source code was produced for The University of
## Edinburgh DEI as part of their MOOC initiative.
## Various functions with utility value
## ****************************************************

# Loop over the vector of schemaIDs, replacing the "**" placeholder in sql with each
# (prefixed by schemaPrefix) and executing on the (already connected) database db.
# Set echo=T to reflect the SQL to output.
# returns a dataframe with rows named by schemaIDs and columns determined by the SQL
tabular.SELECT <- function(db, schemaIDs, sql, echo=FALSE, schemaPrefix=""){
   ret.df<-data.frame()
   for(i in 1:length(schemaIDs)){
      sql.1<-gsub("**", sql, fixed=T, replacement=paste(schemaPrefix,schemaIDs[i],sep=""))
      if(echo && i==1){
         cat(sql.1, sep="\r\n")
      }
      ret.df<-rbind(ret.df,dbGetQuery(db,sql.1))
   }
   rownames(ret.df)<-schemaIDs
   return(ret.df)
}

# Similar to tabular.SELECT but returns a list of data-frames.
# Each list item relates to a mamber of schemaIDs.
# The data-frames will have the same column names (same SQL template) but may have differing no. of rows
list.SELECT <- function(db, schemaIDs, sql, echo=FALSE, schemaPrefix=""){
   ret.list<-list()
   for(i in 1:length(schemaIDs)){
      sql.1<-gsub("**", sql, fixed=T, replacement=paste(schemaPrefix,schemaIDs[i],sep=""))
      if(echo && i==1){
         cat(sql.1, sep="\r\n")
      }
      ret.list[[schemaIDs[i]]]<-dbGetQuery(db,sql.1)
   }
  
   return(ret.list)
}

## ***Made available using the The MIT License (MIT)***
#The MIT License (MIT)
#Copyright (c) 2013 Adam Cooper, University of Bolton
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of
#this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#    
#    The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
## ************ end licence ***************