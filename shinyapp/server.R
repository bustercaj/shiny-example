library(shiny)
data <- read.csv("1.csv", header = TRUE)
data1 <- data[,c(7,9)]
data1$from_station_id <- as.numeric(data1$from_station_id)
data1$to_station_id <- as.numeric(data1$to_station_id)
# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  formulaText <- reactive({
    paste("number_of_", input$column)
  })
  output$caption <- renderText({
    formulaText()
  }) 
  datasetInput <- reactive({
    switch(input$column,
           "from_station_id" = data1$from_station_id,
           "to_station_id" = data1$to_station_id)
  }) 
  output$Plot <- renderPlot({
    hist(datasetInput(), breaks = c(0:400),col="dark red")
  })
})
