### About the ADEME vehicle data

Data displayed here comes from the ADEME carlabelling data published on Data.gouv.fr, the French open data portal. 

* hp
* co2
* nox

h3("About the vehicles"),
    p("425 models with 12 characteristics each:"),
    
    tags$ol(
      tags$li(code("brand"), "The vehicle brand"),
      tags$li(code("model"), "Brand and model name"),
      tags$li(code("hybrid"), "Hybrid (Yes/No)"),
      tags$li(code("admin_power"), "Fiscal horsepower"),
      tags$li(code("kwpower"), "Maximal power (kW)"),
      tags$li(code("weight"), "Minimal weight (kg)"),
      tags$li(code("consumption"), "Gas consumption (l/100km)"),
      tags$li(code("co2"), "CO2"),
      tags$li(code("co_typ_1"), "Type 1 CO test result"),
      tags$li(code("hc"), "HC test result"),
      tags$li(code("nox"), "NOx test result"),
      tags$li(code("hcnox"), "HC+NOX test result")
    ),
    
    h4("Source"),
    a("https://www.data.gouv.fr/fr/datasets/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france"),
    h4("Code"),
    a("https://github.com/boupetch/vehicles-emissions-product")