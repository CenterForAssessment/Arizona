#####################################################################################
###
### Arizona SGP Analyses for 2018
###
#####################################################################################

### Load SGP Package

require(SGP)
require(data.table)


### Load data

load("Data/Arizona_SGP.Rdata")
load("Data/Arizona_Data_LONG_2018.Rdata")
#load("I:/Accountability/Xiaoyuan/SGP2018/data/Arizona_Data_LONG.Rdata")


### Load configurations

source("SGP_CONFIG/2018/ELA.R")
source("SGP_CONFIG/2018/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2018.config, MATHEMATICS_2018.config, ALGEBRA_I_2018.config, GEOMETRY_2018.config, ALGEBRA_II_2018.config)


### updateSGP

Arizona_SGP <- updateSGP(
 			Arizona_SGP,
 			Arizona_Data_LONG_2018,
 			steps=c("prepareSGP", "analyzeSGP", "combineSGP"),
 			sgp.percentiles=TRUE,
 			sgp.projections=TRUE,
 			sgp.projections.lagged=TRUE,
 			sgp.percentiles.baseline=FALSE,
 			sgp.projections.baseline=FALSE,
 			sgp.projections.lagged.baseline=FALSE,
 			simulate.sgps=FALSE,
 			sgp.config=AZ_CONFIG,
 			sgp.target.scale.scores=TRUE)#,
#			parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=8, PROJECTIONS=8, LAGGED_PROJECTIONS=8, SGP_SCALE_SCORE_TARGETS=8, SUMMARY=8, GA_PLOT=8)))


### Save results

save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
#save(Arizona_SGP, file="I:/Accountability/Xiaoyuan/SGP2018/data/Arizona_SGP.Rdata")
