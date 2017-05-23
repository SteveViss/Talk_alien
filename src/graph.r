## create mat adjency based on bartomeus 2016 data.

library("igraph")

devtools::load_all("../alien")

pair <- bartomeus$interactPair
pair <- subset(pair,strength>=20) # Prob: séléctionne que les individus de plantes avec 50 interact et plus

# prep species
idObs <- as.data.frame(unique(bartomeus$idObs[,c("idSp","idInd")]))
idObs$sp <- as.character(idObs$idSp)
idObs$idSp <- as.numeric(idObs$idSp)

idSpFrom <- merge(pair,idObs, all.x=TRUE,by.x="idFrom",by.y="idInd")[,"sp"]
idSpTo <- merge(pair,idObs, all.x=TRUE,by.x="idTo",by.y="idInd")[,"sp"]
