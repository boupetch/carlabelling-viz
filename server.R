library(shiny)

data <- read.csv2("data.csv")

shinyServer(function(input, output) {
  formulaString <- reactive({
    paste("co2 ~ ", input$variable)
  })
  
  fit <- reactive({
    lm(as.formula(formulaString()), data = mpgData)
  })
  
  output$summaryFit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaString()), main = formulaString())
      abline(fit(), col = 4)
    })
  })
})