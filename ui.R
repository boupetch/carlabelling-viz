library(shiny)
require(rCharts)

shinyUI(
pageWithSidebar(
      headerPanel("Visualize the car models sold in France"),
      sidebarPanel(includeMarkdown("documentation.md"),
                   fluidPage(
                     fluidRow(
                       h4("Y Axis"),
                       selectInput("variable1", "",
                           c("Tax horsepower" = "tax_horsepower",
                             "Consumption (l/100)" = "consumption",
                             "Energy" = "energy",
                             "CO2 emission (g/km)" = "co2",
                             "Brand" = "brand",
                             "Hybrid" = "hybrid",
                             "Max Power (kW)" = "kwpower",
                             "Minimal Weight" = "weight",
                             "Type 1 CO" = "co_typ_1",
                             "HC" = "hc",
                             "NOx" = "nox",
                             "HC+NOx"=  "hcnox"
                           )
                           ),
                       h4("X Axis"),
                       selectInput("variable2", "",
                           c("CO2 emission (g/km)" = "co2",
                             "Consumption (l/100)" = "consumption",
                             "Energy" = "energy",
                             "Brand" = "brand",
                             "Hybrid" = "hybrid",
                             "Tax horsepower" = "tax_horsepower",
                             "Max Power (kW)" = "kwpower",
                             "Minimal Weight" = "weight",
                             "Type 1 CO" = "co_typ_1",
                             "HC" = "hc",
                             "NOx" = "nox",
                             "HC+NOx"=  "hcnox"
                           )
               )
             )
           ),
           
           
           h4("Car brands"),
           actionButton(inputId = "clearAll", 
                        label = "Clear selection", 
                        icon = icon("square-o")),
           actionButton(inputId = "selectAll", 
                        label = "Select all", 
                        icon = icon("check-square-o")),
           uiOutput("brandsControl")
    
  ),
  mainPanel(
    tabsetPanel(
      tabPanel(p(icon("circle"), "Chart"),
               showOutput("dataplot", "polycharts")),
      tabPanel(p(icon("table"), "Table"),
                         dataTableOutput(outputId="dTable"))
    ),
    includeMarkdown("about.md")
  )
))