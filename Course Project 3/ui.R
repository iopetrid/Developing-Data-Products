#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(plotly)
library(maps)

data("USArrests")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  
  # Application title
  titlePanel("Crime Rates in US"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons("typeCrime", "Arrest Type:",
                   c("Murder" = "Murder",
                     "Assault" = "Assault",
                     "UrbanPop" = "UrbanPop",
                     "Rape" = "Rape"),selected = colnames(USArrests)[1]),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h5("Graph of Crimes per State"), 
      plotOutput("plot")
    )
  )
))
