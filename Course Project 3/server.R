#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(maps)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot<-renderPlot({
    crimes <- data.frame(state=tolower(rownames(USArrests)), USArrests)
    gg <- ggplot(crimes, aes(map_id=state, fill=USArrests[,input$typeCrime]))
    gg <- gg + guides(fill=guide_legend(title=as.character(input$typeCrime)))
    gg <- gg + geom_map(map=map_data("state"))
    gg <- gg + expand_limits(x=map_data("state")$long, y=map_data("state")$lat)
    gg
  })
  
})


