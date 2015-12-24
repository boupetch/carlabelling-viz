### About the car labelling data

Data displayed here comes from the 2015 [ADEME car labelling data](https://www.data.gouv.fr/fr/datasets/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france) published on [Data.gouv.fr](https://www.data.gouv.fr/fr/), the French open data portal. All vehicles sold in France must succeed various tests to be approved, including emissions tests. The French agency [ADEME](http://www.ademe.fr/) provide these tests results, along with others informations about the cars. The original dataset contains all engines variations for all cars models sold in France. For this visualization, only one version of each car model has been kept for simplicity purposes.

__699__ models are showed here. This visualization displays __13__ variables for each one:

* `brand`: The vehicle brand
* `model`: Brand and model name
* `hybrid`: Hybrid (Yes/No)
* `energy` : The energy type
* `tax_horsepower`: Vehicle [tax horsepower](https://en.wikipedia.org/wiki/Tax_horsepower)
* `kwpower`: [Maximal power (kilowatts)](https://en.wikipedia.org/wiki/Engine_power)
* `weight`: Empty weight (kg)
* `consumption`: Gas consumption (liters/100km)
* `co2`: [CO2](https://en.wikipedia.org/wiki/Carbon_dioxide)
* `co_typ_1`: [Type 1 CO](https://en.wikipedia.org/wiki/Carbon_monoxide) test result (Carbon monoxide)
* `hc`: [HC](https://en.wikipedia.org/wiki/Hydrocarbon) test result (Hydrocarbon)
* `nox`: [NOx](https://en.wikipedia.org/wiki/Nitrogen_oxide) test result (Nitrogen oxides)
* `hcnox`: HC+NOx test result

However, more variables are available in the original dataset. Additional data and documentation is also available on the [ADEME car labelling website](http://carlabelling.ademe.fr/). 

### Emission tests

Emission data  values are results of [standardised European tests](http://www.dieselnet.com/standards/cycles/) conducted on each vehicle model, following [European emission standards] (https://en.wikipedia.org/wiki/European_emission_standards).

### Code & links

* Source code for this application is hosted on  [Github](https://github.com/boupetch/vehicles-emissions-product).
* Nice slides also on [Github](http://boupetch.github.io/carlabelling-slides).
* Find my other works using open data on [Frenchkpi.com](http://www.frenchkpi.com)
* And follow me on [Twitter](https://twitter.com/frenchkpi)! 
