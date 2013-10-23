## Using the google visualization API with R

library(googleVis)

input<- read.csv("country.csv")

Map<- data.frame(input$Country, input$Number)

names(Map)<- c("Country", "Number")

Geo=gvisGeoMap(Map, locationvar="Country", numvar="Number",
               options=list(height=350, dataMode='regions'))

plot(Geo)