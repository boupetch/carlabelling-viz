library(shiny)
require(rCharts)

shinyUI(pageWithSidebar(
  headerPanel("Vehicles emissions"),
  sidebarPanel("Discover how variables correlate",
           fluidPage(
             fluidRow(
               selectInput("variable1", "",
                           c("Consumption (l/100)" = "conso",
                             "CO2 emission (g/km)" = "co2",
                             "Brand" = "marque",
                             "Hybrid" = "hybrid",
                             "Fiscal power" = "puissance_administrative",
                             "Max Power (kW)" = "puissance_maximale",
                             "Type 1 CO" = "co_typ_1",
                             "HC" = "hc",
                             "NOX" = "nox",
                             "HC+NOX"=  "hcnox"
                           )
               ),
               selectInput("variable2", "",
                           c("CO2 emission (g/km)" = "co2",
                             "Consumption (l/100)" = "conso",
                             "Brand" = "marque",
                             "Hybrid" = "hybrid",
                             "Fiscal power" = "puissance_administrative",
                             "Max Power (kW)" = "puissance_maximale",
                             "Type 1 CO" = "co_typ_1",
                             "HC" = "hc",
                             "NOX" = "nox",
                             "HC+NOX"=  "hcnox"
                           )
               )
             )
           )
  ),
  mainPanel(
    showOutput("dataplot", "polycharts")
  )
))