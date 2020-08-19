## run TAGM

require(pRoloc)

load(file = "arabidposis_pbsrep2.rda")

fData(arabidposis_pbsrep2)$markers[fData(arabidposis_pbsrep2)$markers %in% c("cytosolic ribosomes", "extracellular")] <- "unknown"


mcmc_arabidposis_pbsrep2 <- tagmMcmcTrain(object = arabidposis_pbsrep2, fcol = "markers",
                                          numIter = 15000, burnin = 10000, thin = 10, numChains = 4)

setwd("/home/omc25/rds/hpc-work")
saveRDS(mcmc_arabidposis_pbsrep2, file = "mcmc_arabidposis_pbsrep2.rds")