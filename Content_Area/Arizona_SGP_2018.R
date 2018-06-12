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
 			sgp.target.scale.scores=TRUE,
			parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=8, PROJECTIONS=8, LAGGED_PROJECTIONS=8, SGP_SCALE_SCORE_TARGETS=8, SUMMARY=8, GA_PLOT=8)))


### Save results

save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
#save(Arizona_SGP, file="I:/Accountability/Xiaoyuan/SGP2018/data/Arizona_SGP.Rdata")


### Merge in scale score targets to 2018 LONG file

load("Data/Arizona_SGP_Data_LONG_2018.Rdata")


### ELA LAGGED target scale scores

tmp.ela <- Arizona_SGP@SGP$SGProjections$ELA.2018.LAGGED.TARGET_SCALE_SCORES[,c("ID", "SCALE_SCORE_SGP_TARGET_3_YEAR_PROJ_YEAR_1", "GRADE", "SGP_PROJECTION_GROUP")]
tmp.ela[,VALID_CASE:="VALID_CASE"]
tmp.ela[,CONTENT_AREA:="ELA"]
tmp.ela[,YEAR:="2018"]
setkey(tmp.ela, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)
tmp.ela <- unique(tmp.ela, by=key(tmp.ela))

tmp.math <- Arizona_SGP@SGP$SGProjections$MATHEMATICS.2018.LAGGED.TARGET_SCALE_SCORES[,c("ID", "SCALE_SCORE_SGP_TARGET_3_YEAR_PROJ_YEAR_1", "GRADE", "SGP_PROJECTION_GROUP")]
tmp.math[,VALID_CASE:="VALID_CASE"]
tmp.math[,CONTENT_AREA:="MATHEMATICS"]
tmp.math[,YEAR:="2018"]
setkey(tmp.math, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)
tmp.math <- unique(tmp.math, by=key(tmp.math))

tmp.alg1 <- Arizona_SGP@SGP$SGProjections$ALGEBRA_I.2018.LAGGED.TARGET_SCALE_SCORES[,c("ID", "SCALE_SCORE_SGP_TARGET_3_YEAR_PROJ_YEAR_1", "GRADE", "SGP_PROJECTION_GROUP")]
tmp.alg1[,VALID_CASE:="VALID_CASE"]
tmp.alg1[,CONTENT_AREA:="ALGEBRA_I"]
tmp.alg1[,YEAR:="2018"]
setkey(tmp.alg1, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)
tmp.alg1 <- unique(tmp.alg1, by=key(tmp.alg1))

tmp.geom <- Arizona_SGP@SGP$SGProjections$GEOMETRY.2018.LAGGED.TARGET_SCALE_SCORES[,c("ID", "SCALE_SCORE_SGP_TARGET_3_YEAR_PROJ_YEAR_1", "GRADE", "SGP_PROJECTION_GROUP")]
tmp.geom[,VALID_CASE:="VALID_CASE"]
tmp.geom[,CONTENT_AREA:="GEOMETRY"]
tmp.geom[,YEAR:="2018"]
setkey(tmp.geom, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)
tmp.geom <- unique(tmp.geom, by=key(tmp.geom))

tmp.alg2 <- Arizona_SGP@SGP$SGProjections$ALGEBRA_II.2018.LAGGED.TARGET_SCALE_SCORES[,c("ID", "SCALE_SCORE_SGP_TARGET_3_YEAR_PROJ_YEAR_1", "GRADE", "SGP_PROJECTION_GROUP")]
tmp.alg2[,VALID_CASE:="VALID_CASE"]
tmp.alg2[,CONTENT_AREA:="ALGEBRA_II"]
tmp.alg2[,YEAR:="2018"]
setkey(tmp.alg2, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)
tmp.alg2 <- unique(tmp.alg2, by=key(tmp.alg2))

tmp <- rbindlist(list(tmp.ela, tmp.math, tmp.alg1, tmp.geom, tmp.alg2))
setkey(tmp, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)
setkey(Arizona_SGP_LONG_Data_2018, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID, SGP_PROJECTION_GROUP)

Arizona_SGP_LONG_Data_2018 <- tmp[Arizona_SGP_LONG_Data_2018]

save(Arizona_SGP_LONG_Data_2018, file="Data/Arizona_SGP_LONG_Data_2018.Rdata")
fwrite(Arizona_SGP_LONG_Data_2018, file="Data/Arizona_SGP_LONG_Data_2018.txt", sep="|", quote=FALSE)
