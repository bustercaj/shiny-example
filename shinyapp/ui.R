library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Divvy Bike"),
  
  sidebarPanel(
    selectInput("column", "Choose a variable:", 
                choices = c("from_station_id", "to_station_id"))
  ),
  
  mainPanel(h3(textOutput("caption")),
            
            plotOutput("Plot"))
))
