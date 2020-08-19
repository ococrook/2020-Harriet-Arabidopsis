## run TAGM

require(pRoloc)

load(file = "arabidposis_pbsrep1.rda")

fData(arabidposis_pbsrep1)$markers2[fData(arabidposis_pbsrep1)$markers2 %in% c("cytosolic ribosomes", "extracellular")] <- "unknown"


mcmc_arabidposis_pbsrep1_markers2 <- tagmMcmcTrain(object = arabidposis_pbsrep1, fcol = "markers2",
                                          numIter = 15000, burnin = 10000, thin = 10, numChains = 4)

setwd("/home/omc25/rds/hpc-work")
saveRDS(mcmc_arabidposis_pbsrep1_markers2, file = "mcmc_arabidposis_pbsrep1_markers2.rds")