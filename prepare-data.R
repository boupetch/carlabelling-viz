# https://www.data.gouv.fr/fr/datasets/emissions-de-co2-et-de-polluants-des-vehicules-commercialises-en-france/
# https://www.data.gouv.fr/storage/f/2014-07-04T11-59-59/carlab-annuaire-variable.xlsx

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
vehicules$energ <- NULL
vehicules$typ_boite_nb_rapp <- NULL
vehicules$ptcl <- NULL
vehicules$masse_ordma_min <- NULL
vehicules$masse_ordma_max <- NULL

names(vehicules)[names(vehicules)=="mrq_utac"] <- "marque"
names(vehicules)[names(vehicules)=="mod_utac"] <- "modele"
vehicules$modele <- paste(vehicules$marque, vehicules$modele)

names(vehicules)[names(vehicules)=="puiss_admin"] <- "puissance_administrative"
names(vehicules)[names(vehicules)=="conso_mixte"] <- "conso"

names(vehicules)[names(vehicules)=="co2_mixte"] <- "co2"
vehicules$co2 <- as.numeric(vehicules$co2)

names(vehicules)[names(vehicules)=="hybride"] <- "hybrid"
vehicules$hybrid <- as.character(vehicules$hybrid)
vehicules$hybrid[vehicules$hybrid == "oui "] <- "Yes"
vehicules$hybrid[vehicules$hybrid == "non "] <- "No"

names(vehicules)[names(vehicules)=="puiss_max"] <- "puissance_maximale"
vehicules$puissance_maximale <- as.numeric(vehicules$puissance_maximale)

vehicules$co_typ_1 <- as.double(as.character(vehicules$co_typ_1))
vehicules$hc <- as.double(as.character(vehicules$hc))
vehicules$nox <- as.double(as.character(vehicules$nox))
vehicules$hcnox <- as.double(as.character(vehicules$hcnox))
vehicules$conso <- as.double(as.character(vehicules$conso))


vehicules <- vehicules[!duplicated(vehicules$modele),]

write.csv2(vehicules,"data.csv",row.names=FALSE)
