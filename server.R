library(shiny)
library(rCharts)

vehicles <- read.csv2("data.csv")
vehicles$consumption <- as.double(as.character(vehicles$consumption))
vehicles$brand <- as.character(vehicles$brand)
vehicles$model <- as.character(vehicles$model)
vehicles$hybrid <- as.character(vehicles$hybrid)
vehicles$energy <- as.character(vehicles$energy)
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

    tooltip <- paste("#!function(item){ return item.id +' ",
                     input$variable2,
                     ": ' + item.",
                     input$variable2,
                     " +' ",
                     input$variable1,
                     ": ' + item.",
                     input$variable1,
                     " }!#",
                     sep="")
    p1 <- rPlot(as.formula(formulaText()), data=subsetvehicles(), type = 'point', color = 'brand', tooltip = tooltip)
    
    if(sapply(vehicles[c(input$variable2)], class)[[1]] != "character" ) {
      p1$guides(x = list(
        min =  min(vehicles[c(input$variable2)]) - (max(vehicles[c(input$variable2)])/20),
        max = max(vehicles[c(input$variable2)]) + (max(vehicles[c(input$variable2)])/20),
        labels = pretty( vehicles[c(input$variable2)][[1]] )
      )
      )
    }
    else{
      p1$guides(
        x = list(
          #numticks = length( levels( as.factor(vehicles[c(input$variable2)]) ) ),
          #labels =as.factor(vehicles[c(input$variable2)][[1]])
        )
      )
    }
    if(sapply(vehicles[c(input$variable1)], class)[[1]] != "character" ) {
      p1$guides(y = list(
        min =  min(vehicles[c(input$variable1)]) - (max(vehicles[c(input$variable1)])/20),
        max = max(vehicles[c(input$variable1)]) + (max(vehicles[c(input$variable1)])/20),
        labels = pretty( vehicles[c(input$variable1)][[1]] )
      )
      )
    }
    else{
      p1$guides(
        y = list(
          numticks = length( levels( as.factor(vehicles[c(input$variable1)][[1]]) ) ),
          labels =as.factor(vehicles[c(input$variable1)][[1]])
        )
      )
    }
    
    p1$guides(
      color = list(
        numticks = length( levels( as.factor(vehicles$brand) ) )
      )
    )
    p1$params$height <- 600
    
    return(p1)
    
  }) 
  output$dTable = renderDataTable({
    subsetvehicles()
  })
  
})