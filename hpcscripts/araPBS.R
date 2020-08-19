## run TAGM

require(pRoloc)

load(file = "arabidposis_pbs.rda")

fData(arabidposis_pbs)$markers[fData(arabidposis_pbs)$markers %in% c("cytosolic ribosomes", "extracellular")] <- "unknown"


mcmc_arabidposis_pbs <- tagmMcmcTrain(object = arabidposis_pbs, fcol = "markers",
                                      numIter = 15000, burnin = 10000, thin = 10, numChains = 4)

setwd("/home/omc25/rds/hpc-work")
saveRDS(mcmc_arabidposis_pbs, file = "mcmc_arabidposis_pbs.rds")