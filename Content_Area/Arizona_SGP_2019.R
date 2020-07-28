#####################################################################################
###
### Arizona SGP Analyses for 2019
###
#####################################################################################

### Load SGP Package

require(SGP)
require(data.table)


### Load data

load("Data/Arizona_Data_LONG_2019_ALL_YEARS.Rdata")


### Load configurations

source("SGP_CONFIG/2019/ELA.R")
source("SGP_CONFIG/2019/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2019.config, MATHEMATICS_2019.config, ALGEBRA_I_2019.config, GEOMETRY_2019.config, ALGEBRA_II_2019.config)


### updateSGP

Arizona_SGP <- abcSGP(
    Arizona_Data_LONG,
        Arizona_Data_LONG_2019_ALL_YEARS,
 	steps=c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
 	sgp.percentiles=TRUE,
 	sgp.projections=TRUE,
 	sgp.projections.lagged=TRUE,
 	sgp.percentiles.baseline=FALSE,
 	sgp.projections.baseline=FALSE,
 	sgp.projections.lagged.baseline=FALSE,
 	simulate.sgps=FALSE,
 	sgp.config=AZ_CONFIG,
 	sgp.target.scale.scores=TRUE,
	parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=8, PROJECTIONS=8, LAGGED_PROJECTIONS=8, SGP_SCALE_SCORE_TARGETS=8, SUMMARY=4, GA_PLOT=4)))


### Save results

save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
