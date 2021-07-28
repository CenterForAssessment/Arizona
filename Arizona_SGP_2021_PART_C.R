################################################################################
###                                                                          ###
###           SGP LAGGED projections for skip year SGP analyses for 2021     ###
###                                                                          ###
################################################################################

###   Load packages
require(SGP)
require(SGPmatrices)

###   Load data
load("Data/Arizona_SGP.Rdata")

###   Load configurations
source("SGP_CONFIG/2021/PART_C/ELA.R")
source("SGP_CONFIG/2021/PART_C/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2021.config, MATHEMATICS_2021.config)

### Parameters
parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4))

###   Setup SGPstateData with baseline coefficient matrices grade specific projection sequences

###   Add Baseline matrices to SGPstateData and update SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2021")
SGPstateData[["AZ"]][["Growth"]][["System_Type"]] <- "Baseline Referenced"

#  Establish required meta-data for LAGGED projection sequences
SGPstateData[["AZ"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
    ELA_GRADE_3=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_4=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_5=c(3, 5, 6, 7, 8),
    ELA_GRADE_6=c(3, 4, 6, 7, 8),
    ELA_GRADE_7=c(3, 4, 5, 7, 8),
    ELA_GRADE_8=c(3, 4, 5, 6, 8),
    ELA_GRADE_10=c(3, 4, 5, 6, 8, 10),
    MATHEMATICS_GRADE_3=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_4=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_5=c(3, 5, 6, 7, 8),
    MATHEMATICS_GRADE_6=c(3, 4, 6, 7, 8),
    MATHEMATICS_GRADE_7=c(3, 4, 5, 7, 8),
    MATHEMATICS_GRADE_8=c(3, 4, 5, 6, 8))
SGPstateData[["AZ"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
    ELA_GRADE_3=rep("ELA", 6),
    ELA_GRADE_4=rep("ELA", 6),
    ELA_GRADE_5=rep("ELA", 5),
    ELA_GRADE_6=rep("ELA", 5),
    ELA_GRADE_7=rep("ELA", 5),
    ELA_GRADE_8=rep("ELA", 5),
    ELA_GRADE_10=rep("ELA", 6),
    MATHEMATICS_GRADE_3=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_4=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_5=rep("MATHEMATICS", 5),
    MATHEMATICS_GRADE_6=rep("MATHEMATICS", 5),
    MATHEMATICS_GRADE_7=rep("MATHEMATICS", 5),
    MATHEMATICS_GRADE_8=rep("MATHEMATICS", 5))
SGPstateData[["AZ"]][["SGP_Configuration"]][["max.forward.projection.sequence"]] <- list(
    ELA_GRADE_3=3,
    ELA_GRADE_4=3,
    ELA_GRADE_5=3,
    ELA_GRADE_6=3,
    ELA_GRADE_7=3,
    ELA_GRADE_8=3,
    ELA_GRADE_10=3,
    MATHEMATICS_GRADE_3=3,
    MATHEMATICS_GRADE_4=3,
    MATHEMATICS_GRADE_5=3,
    MATHEMATICS_GRADE_6=3,
    MATHEMATICS_GRADE_7=3,
    MATHEMATICS_GRADE_8=3)


### Run analysis

Arizona_SGP <- abcSGP(
        Arizona_SGP,
        steps=c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
        sgp.config=AZ_CONFIG,
        sgp.percentiles=FALSE,
        sgp.projections=FALSE,
        sgp.projections.lagged=FALSE,
        sgp.percentiles.baseline=FALSE,
        sgp.projections.baseline=FALSE,
        sgp.projections.lagged.baseline=TRUE,
        sgp.target.scale.scores=TRUE,
        outputSGP.directory=output.directory,
        parallel.config=parallel.config
)


###  Save results
save(Arizona_SGP, "Data/Arizona_SGP.Rdata"))
