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
names(vehicules)[names(vehicules)=="mrq_utac"] <- "marque"
names(vehicules)[names(vehicules)=="mod_utac"] <- "modele"
names(vehicules)[names(vehicules)=="puiss_admin"] <- "puissance_administrative"
names(vehicules)[names(vehicules)=="puiss_max"] <- "puissance_maximale"

write.csv2(vehicules,"data.csv",row.names=FALSE)
