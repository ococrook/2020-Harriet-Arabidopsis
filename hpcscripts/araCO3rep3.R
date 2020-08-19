## run TAGM

require(pRoloc)

load(file = "arabidposis_co3rep3.rda")

fData(arabidposis_co3rep3)$markers[fData(arabidposis_co3rep3)$markers %in% c("cytosolic ribosomes", "extracellular")] <- "unknown"


mcmc_arabidposis_co3rep3 <- tagmMcmcTrain(object = arabidposis_co3rep3, fcol = "markers",
                                          numIter = 15000, burnin = 10000, thin = 10, numChains = 4)

setwd("/home/omc25/rds/hpc-work")
saveRDS(mcmc_arabidposis_co3rep3, file = "mcmc_arabidposis_co3rep3.rds")