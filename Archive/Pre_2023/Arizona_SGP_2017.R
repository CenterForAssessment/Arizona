#####################################################################################
###
### Arizona SGP Analyses for 2017
###
#####################################################################################

### Load SGP Package

require(SGP)
require(data.table)


### Load data

load("Data/Arizona_Data_LONG.Rdata")
#load("I:/Accountability/Xiaoyuan/SGP2017/data/Arizona_Data_LONG.Rdata")


### Load configurations

source("SGP_CONFIG/2017/ELA.R")
source("SGP_CONFIG/2017/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2017.config, MATHEMATICS_2017.config, ALGEBRA_I_2017.config, GEOMETRY_2017.config, ALGEBRA_II_2017.config)


### updateSGP

Arizona_SGP <- abcSGP(
 			Arizona_Data_LONG,
 			steps=c("prepareSGP", "analyzeSGP", "combineSGP"),
 			sgp.percentiles=TRUE,
 			sgp.projections=TRUE,
 			sgp.projections.lagged=TRUE,
 			sgp.percentiles.baseline=FALSE,
 			sgp.projections.baseline=FALSE,
 			sgp.projections.lagged.baseline=FALSE,
 			simulate.sgps=FALSE,
 			sgp.config=AZ_CONFIG,
 			sgp.target.scale.scores=FALSE)#,
#			parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=8, PROJECTIONS=8, LAGGED_PROJECTIONS=8, SGP_SCALE_SCORE_TARGETS=8, SUMMARY=8, GA_PLOT=8)))


### Save results

save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
#save(Arizona_SGP, file="I:/Accountability/Xiaoyuan/SGP2017/data/Arizona_SGP.Rdata")
