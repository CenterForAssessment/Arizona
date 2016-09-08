#####################################################################################
###
### Arizona SGP Analyses for 2016
###
#####################################################################################

### Load SGP Package

require(SGP)
require(data.table)


### Load data

load("Data/Arizona_Data_LONG.Rdata")


### Load configurations

source("SGP_CONFIG/2016/ELA.R")
source("SGP_CONFIG/2016/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2016.config, MATHEMATICS_2016.config)


### updateSGP

Arizona_SGP <- abcSGP(
			Arizona_Data_LONG,
			steps=c("prepareSGP", "analyzeSGP", "combineSGP", "summarizeSGP"),
			sgp.percentiles=TRUE,
			sgp.projections=TRUE,
			sgp.projections.lagged=TRUE,
			sgp.percentiles.baseline=FALSE,
			sgp.projections.baseline=FALSE,
			sgp.projections.lagged.baseline=FALSE,
			simulate.sgps=FALSE,
			sgp.config=AZ_CONFIG,
			sgp.target.scale.scores=TRUE)#,
#			parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=2, PROJECTIONS=2)))


### Save results

save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
