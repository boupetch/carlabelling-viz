library(shiny)
require(rCharts)

vehicles <- read.csv2("data.csv")
vehicles$consumption <- as.double(as.character(vehicles$consumption))
vehicles$brand <- as.character(vehicles$brand)
vehicles$model <- as.character(vehicles$model)
brands <- sort(unique(vehicles$brand))

shinyServer( function(input, output) {

  # Initialize reactive values
  values <- reactiveValues()
  values$brands <- brands
  
  output$brandsControl <- renderUI({
    checkboxGroupInput('brands', '', 
                       brands, selected = values$brands)
  })
  
  # Add observer on select-all button
  observe({
    if(input$selectAll == 0) return()
    values$brands <- brands
  })
  
  # Add observer on clear-all button
  observe({
    if(input$clearAll == 0) return()
    values$brands <- c() # empty list
  })
  
  formulaText <- reactive({
    paste(input$variable1,"~", input$variable2)
  })
  
  subsetvehicles <- reactive({
    subsetvehicles <- vehicles[vehicles$brand %in%  input$brands, ]
    #cat("OK2")
  })
  
  output$dataplot <- renderChart2({

    p1 <- rPlot(as.formula(formulaText()), data=subsetvehicles(), type = 'point', color = 'brand')
    #p1$set(legendPosition = "none")
    return(p1)
    
  }) 
  
  output$dTable = renderDataTable({
    subsetvehicles()
  })
    
    
  
})