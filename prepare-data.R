# https://www.data.gouv.fr/fr/datasets/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france/
# https://www.data.gouv.fr/storage/f/2014-07-04T11-59-59/carlab-annuaire-variable.xlsx
# https://www.data.gouv.fr/s/resources/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france/20151015-121340/fic_etiq_edition_40-mars-2015.zip
# http://carlabelling.ademe.fr/

# returns string w/o leading or trailing whitespace
# http://stackoverflow.com/questions/2261079/how-to-trim-leading-and-trailing-whitespace-in-r
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

#http://stackoverflow.com/questions/6364783/capitalize-the-first-letter-of-both-words-in-a-two-word-string
simpleCap <- function(x) {
  s <- tolower(x)
  s <- strsplit(s, " ")[[1]]
  return (paste(toupper(substring(s, 1,1)), substring(s, 2),
                sep="", collapse=" "))
}

vehicules <- read.csv2("fic_etiq_edition_40-mars-2015.csv")
vehicules$lib_mrq_doss <- NULL
vehicules$lib_mod_doss <- NULL
vehicules$dscom <- NULL
vehicules$cnit <- NULL
vehicules$tvv <- NULL
vehicules$champ_v9 <- NULL
vehicules$date_maj <- NULL
vehicules$puiss_heure <- NULL
vehicules$conso_urb_93 <- NULL
vehicules$conso_exurb <- NULL
vehicules$typ_boite_nb_rapp <- NULL
vehicules$ptcl <- NULL
vehicules$masse_ordma_max <- NULL

# http://www.carte-grise.org/nomenclature/P.3-type-carburant-energie.php
vehicules$energ <- as.character(vehicules$energ)
vehicules$energ[vehicules$energ == "ES "] <- "Petrol"
vehicules$energ[vehicules$energ == "GO "] <- "Diesel"
vehicules$energ[vehicules$energ == "ES/GP "] <- "Petrol/PGL"
vehicules$energ[vehicules$energ == "GP/ES "] <- "Petrol/PGL"
vehicules$energ[vehicules$energ == "EE "] <- "Petrol/Electricity (Rechargeable)"
vehicules$energ[vehicules$energ == "EL "] <- "Electricity"
vehicules$energ[vehicules$energ == "EH "] <- "Petrol/Electricity (Non rechargeable)"
vehicules$energ[vehicules$energ == "GH "] <- "Diesel/Electricity (Non rechargeable)"
vehicules$energ[vehicules$energ == "ES/GN "] <- "Petrol/Natural gas"
vehicules$energ[vehicules$energ == "GN/ES "] <- "Petrol/Natural gas"
vehicules$energ[vehicules$energ == "FE "] <- "Ethanol"
vehicules$energ[vehicules$energ == "GN "] <- "Natural gas"
vehicules$energ[vehicules$energ == "GL "] <- "Diesel/Electricity (Rechargeable)"
names(vehicules)[names(vehicules)=="energ"] <- "energy"

names(vehicules)[names(vehicules)=="mrq_utac"] <- "brand"
vehicules$brand <- as.character(vehicules$brand)
vehicules$brand <- sapply(vehicules$brand, simpleCap)
vehicules$brand[vehicules$brand == "Bmw"] <- "BMW"

names(vehicules)[names(vehicules)=="mod_utac"] <- "model"
vehicules$model <- paste(vehicules$brand, vehicules$model)

names(vehicules)[names(vehicules)=="puiss_admin"] <- "tax_horsepower"
names(vehicules)[names(vehicules)=="conso_mixte"] <- "consumption"

names(vehicules)[names(vehicules)=="masse_ordma_min"] <- "weight"

names(vehicules)[names(vehicules)=="co2_mixte"] <- "co2"
vehicules$co2 <- as.numeric(vehicules$co2)

names(vehicules)[names(vehicules)=="hybride"] <- "hybrid"
vehicules$hybrid <- as.character(vehicules$hybrid)
vehicules$hybrid[vehicules$hybrid == "oui "] <- "Yes"
vehicules$hybrid[vehicules$hybrid == "non "] <- "No"

names(vehicules)[names(vehicules)=="puiss_max"] <- "kwpower"
vehicules$kwpower <- as.double(as.character(vehicules$kwpower))

vehicules$co_typ_1 <- as.double(as.character(vehicules$co_typ_1))
vehicules$hc <- as.double(as.character(vehicules$hc))
vehicules$nox <- as.double(as.character(vehicules$nox))
vehicules$hcnox <- as.double(as.character(vehicules$hcnox))
vehicules$consumption <- as.double(as.character(vehicules$consumption))

vehicules$consumption[is.na(vehicules$consumption)] <- 0
vehicules$hcnox[is.na(vehicules$hcnox)] <- 0
vehicules$nox[is.na(vehicules$nox)] <- 0
vehicules$hc[is.na(vehicules$hc)] <- 0
vehicules$co_typ_1[is.na(vehicules$co_typ_1)] <- 0
vehicules$co2[is.na(vehicules$co2)] <- 0
vehicules$kwpower[is.na(vehicules$kwpower)] <- 0

vehicules$id <- paste(trim(vehicules$model),vehicules$energy)
vehicules <- vehicules[!duplicated(c(vehicules$id)),]


write.csv2(vehicules,"data.csv",row.names=FALSE)
# dim(vehicules)[1]
