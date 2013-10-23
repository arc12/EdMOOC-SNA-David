df<-read.csv("topics_posts.csv" , header=T, sep=",")
M = as.matrix( table(df) )
Mrow = M %*% t(M)
#Mcol = t(M) %*% M
iMrow = graph.adjacency(Mrow, mode = "undirected")
E(iMrow)$weight <- count.multiple(iMrow)
iMrow <- simplify(iMrow)
write.graph(iMrow, file="graph.graphml", format="graphml");