## create mat adjency based on bartomeus 2016 data.

library("igraph")

devtools::load_all("../alien")

pair <- bartomeus$interactPair
# prep species
idObs <- as.data.frame(unique(bartomeus$idObs[,c("idSp","idInd")]))
idObs$sp <- as.character(idObs$idSp)
idObs$idSp <- as.numeric(idObs$idSp)

pair$idSpFrom <- merge(pair,idObs, all.x=TRUE,by.x="idFrom",by.y="idInd")[,"sp"]
pair$idSpTo <- merge(pair,idObs, all.x=TRUE,by.x="idTo",by.y="idInd")[,"sp"]

pair <- pair[,c('idSpTo','idSpFrom','strength')]
pair <- aggregate(strength ~ idSpTo + idSpFrom, data=pair, FUN=sum)
apis <- subset(pair, idSpTo == 'Apis mellifera')
