## run TAGM

require(pRoloc)

load(file = "arabidposis_pbs.rda")

fData(arabidposis_pbs)$markers2[fData(arabidposis_pbs)$markers2 %in% c("cytosolic ribosomes", "extracellular")] <- "unknown"


mcmc_arabidposis_pbs_markers2 <- tagmMcmcTrain(object = arabidposis_pbs, fcol = "markers2",
                                      numIter = 15000, burnin = 10000, thin = 10, numChains = 4)

setwd("/home/omc25/rds/hpc-work")
saveRDS(mcmc_arabidposis_pbs_markers2, file = "mcmc_arabidposis_pbs_markers2.rds")