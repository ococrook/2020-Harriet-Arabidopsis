## run TAGM

require(pRoloc)

load(file = "arabidposis_pbsrep4.rda")

fData(arabidposis_pbsrep4)$markers[fData(arabidposis_pbsrep4)$markers %in% c("cytosolic ribosomes", "extracellular")] <- "unknown"


mcmc_arabidposis_pbsrep4 <- tagmMcmcTrain(object = arabidposis_pbsrep4, fcol = "markers",
                                          numIter = 15000, burnin = 10000, thin = 10, numChains = 4)

setwd("/home/omc25/rds/hpc-work")
saveRDS(mcmc_arabidposis_pbsrep4, file = "mcmc_arabidposis_pbsrep4.rds")