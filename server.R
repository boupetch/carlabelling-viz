library(shiny)
require(rCharts)

vehicles <- read.csv2("data.csv",stringsAsFactors = TRUE)

shinyServer( function(input, output) {
  
  output$dataplot <- renderChart2({
  p1 <- rPlot(x=input$variable1,y=input$variable2, data = vehicles, type = 'point', color = 'modele')
  p1$set(legendPosition = "none")
  return(p1)
  })
  
})