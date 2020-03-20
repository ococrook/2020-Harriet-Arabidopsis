

csv <- "../RawData/HyperLOPIT_PBS_recon_zeros.csv"
csvMarkers1 <- "../RawData/arabidopsis_organelle_markers.csv"
csvMarkers2 <- "../RawData/arabidopsis_suborganelle_ribosomes_markers.csv"

csv2 <- "../RawData/HyperLOPIT_CO3_recon_zeros.csv"

arabidposis_pbs <- readMSnSet2(csv, ecol = 3:46, fnames = 2)
arabidposis_co3 <- readMSnSet2(csv2, ecol = 3:42, fnames = 2)

arabidposis_pbs <- addMarkers(object = arabidposis_pbs, markers = csvMarkers1)
arabidposis_pbs <- addMarkers(object = arabidposis_pbs, markers = csvMarkers2, mcol = "markers2")

arabidposis_co3 <- addMarkers(object = arabidposis_co3, markers = csvMarkers1)
arabidposis_co3 <- addMarkers(object = arabidposis_co3, markers = csvMarkers2, mcol = "markers2")


arabidposis_pbsrep1 <- readMSnSet2("LOPIT_PBS_r1_recon_zeros.csv", ecol = 3:13, fnames = 2)
arabidposis_pbsrep2 <- readMSnSet2("LOPIT_PBS_r2_recon_zeros.csv", ecol = 3:13, fnames = 2)
arabidposis_pbsrep3 <- readMSnSet2("LOPIT_PBS_r3_recon_zeros.csv", ecol = 3:13, fnames = 2)
arabidposis_pbsrep4 <- readMSnSet2("LOPIT_PBS_r4_recon_zeros.csv", ecol = 3:13, fnames = 2)

arabidposis_co3rep1 <- readMSnSet2("LOPIT_CO3_r1_recon_zeros.csv", ecol = 3:12, fnames = 2)
arabidposis_co3rep2 <- readMSnSet2("LOPIT_CO3_r2_recon_zeros.csv", ecol = 3:12, fnames = 2)
arabidposis_co3rep3 <- readMSnSet2("LOPIT_CO3_r3_recon_zeros.csv", ecol = 3:12, fnames = 2)
arabidposis_co3rep4 <- readMSnSet2("LOPIT_Co3_r4_recon_zeros.csv", ecol = 3:12, fnames = 2)

arabidposis_pbsrep1 <- addMarkers(object = arabidposis_pbsrep1, markers = csvMarkers1)
arabidposis_pbsrep1 <- addMarkers(object = arabidposis_pbsrep1, markers = csvMarkers2, mcol = "markers2")

arabidposis_pbsrep2 <- addMarkers(object = arabidposis_pbsrep2, markers = csvMarkers1)
arabidposis_pbsrep2 <- addMarkers(object = arabidposis_pbsrep2, markers = csvMarkers2, mcol = "markers2")

arabidposis_pbsrep3 <- addMarkers(object = arabidposis_pbsrep3, markers = csvMarkers1)
arabidposis_pbsrep3 <- addMarkers(object = arabidposis_pbsrep3, markers = csvMarkers2, mcol = "markers2")

arabidposis_pbsrep4 <- addMarkers(object = arabidposis_pbsrep4, markers = csvMarkers1)
arabidposis_pbsrep4 <- addMarkers(object = arabidposis_pbsrep4, markers = csvMarkers2, mcol = "markers2")

arabidposis_co3rep1 <- addMarkers(object = arabidposis_co3rep1, markers = csvMarkers1)
arabidposis_co3rep1 <- addMarkers(object = arabidposis_co3rep1, markers = csvMarkers2, mcol = "markers2")

arabidposis_co3rep2 <- addMarkers(object = arabidposis_co3rep2, markers = csvMarkers1)
arabidposis_co3rep2 <- addMarkers(object = arabidposis_co3rep2, markers = csvMarkers2, mcol = "markers2")

arabidposis_co3rep3 <- addMarkers(object = arabidposis_co3rep3, markers = csvMarkers1)
arabidposis_co3rep3 <- addMarkers(object = arabidposis_co3rep3, markers = csvMarkers2, mcol = "markers2")

arabidposis_co3rep4 <- addMarkers(object = arabidposis_co3rep4, markers = csvMarkers1)
arabidposis_co3rep4 <- addMarkers(object = arabidposis_co3rep4, markers = csvMarkers2, mcol = "markers2")


getMarkers(arabidposis_pbs)

par(mfrow = c(1,1))
plot2D(arabidposis_pbs, dims = c(1,3))
addLegend(arabidposis_pbs)
plot2D(arabidposis_pbs, fcol = "markers2", dims = c(1,2), method = "t-SNE")

plot2D(arabidposis_co3, dims = c(1,2), fcol = "markers2")


par(mfrow = c(4,5))
for (j in seq_along(getMarkerClasses(arabidposis_pbs, fcol = "markers2"))) {
  matplot(t(exprs(arabidposis_pbs[fData(arabidposis_pbs)$markers2 == getMarkerClasses(arabidposis_pbs, fcol = "markers2")[j], ])),
         lty = 1, col  = getStockcol()[j], type = "l", ylab = paste0(getMarkerClasses(arabidposis_pbs,  fcol = "markers2")[j]))
}


require(MSnbase)
require(pRoloc)
require(pRolocdata)
install.packages("lbfgs")
require(lbfgs)
require(Rcpp)
require(RcppArmadillo)


sourceCpp("dmvtCpp.cpp")
source("gradientGP.R")
sourceCpp("gradienthyp.cpp")
source("hamiltonianGP.R")
sourceCpp("leapfrogGPcpp.cpp")
source("likelihoodGP.R")
source("metropolisGP.R")
source("mixGP.R")
sourceCpp("trenchDetcpp.cpp")
source("fitGP.R")

arabidposis_pbs <- normalise(object = arabidposis_pbs, method = "center.median")

par(mfrow = c(3,4))
fitGP(arabidposis_pbs)

mcmcco3rep1 <- tagmMapTrain(arabidposis_co3rep1)
arabidposis_co3rep1 <- tagmMapPredict(arabidposis_co3rep1, mcmcco3rep1)

