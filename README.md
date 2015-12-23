---
output: html_document
---
## ADEME car labelling data visualization

The ADEME car labelling data visualization is a simple app is built with [Shiny](http://shiny.rstudio.com/), a web application framework for R. Data is [published by the ADEME](https://www.data.gouv.fr/fr/datasets/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france) on [Data.gouv.fr](https://www.data.gouv.fr/fr/), the French open data portal.


### Run the application

To run the application in R, execute the following commands:

```
library(shiny)
runGitHub( "carlabelling-viz", "boupetch") 
```

### Data preparation

ADEME data have been cleaned, translated and export to a new csv file. [`prepare-data.R`](https://github.com/boupetch/carlabelling-viz/blob/master/prepare-data.R) file provides the [`data.csv`](https://github.com/boupetch/carlabelling-viz/blob/master/data.csv) contains procedure. The app only uses [`data.csv`](https://github.com/boupetch/carlabelling-viz/blob/master/data.csv) as a data source.

### Librairies

This app uses [rCharts](http://rcharts.io/) and [Polycharts](https://github.com/Polychart)
This [issue thread](https://github.com/ramnathv/rCharts/issues/77) answered a lot of my questions and helped me displaying a clean and nice chart.
