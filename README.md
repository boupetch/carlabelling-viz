## ADEME car labelling data visualization

The ADEME car labelling data visualization is a simple app is built with [Shiny](http://shiny.rstudio.com/), a web application framework for R. Data is [published by the ADEME](https://www.data.gouv.fr/fr/datasets/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france) on [Data.gouv.fr](https://www.data.gouv.fr/fr/), the French open data portal.


### Run the application

Execute the following commands in R to install required librairies and run the app:

```
install.packages("shiny")
install.packages("devtools")
library(shiny)
library(devtools)
install_github('rCharts', 'ramnathv')
runGitHub("carlabelling-viz", "boupetch") 
```

### Data preparation

ADEME data have been cleaned, translated and export to a new csv file. [`prepare-data.R`](https://github.com/boupetch/carlabelling-viz/blob/master/prepare-data.R) script provides the creation process of [`data.csv`](https://github.com/boupetch/carlabelling-viz/blob/master/data.csv), the application only data source. 

### Librairies

This app uses [rCharts](http://rcharts.io/). This [thread](https://github.com/ramnathv/rCharts/issues/77) answered a lot of my questions.
