################################################################################
###                                                                          ###
###          SGP STRAIGHT projections for skip year SGP analyses for 2021    ###
###                                                                          ###
################################################################################

###   Load packages
require(SGP)
require(SGPmatrices)

###   Load data
load("Data/Arizona_SGP.Rdata"))

###   Load configurations
source("SGP_CONFIG/2021/PART_B/ELA.R")
source("SGP_CONFIG/2021/PART_B/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2021.config, MATHEMATICS_2021.config)

### Parameters
parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4))

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2021")
SGPstateData[["AZ"]][["SGP_Configuration"]][["sgp.target.scale.scores.merge"]] <- NULL

#  Establish required meta-data for STRAIGHT projection sequences
SGPstateData[["AZ"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
    ELA_GRADE_3=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_4=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_5=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_6=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_7=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_8=c(3, 4, 5, 6, 7, 8),
    ELA_GRADE_10=c(3, 4, 5, 6, 7, 8, 10),
    MATHEMATICS_GRADE_3=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_4=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_5=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_6=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_7=c(3, 4, 5, 6, 7, 8),
    MATHEMATICS_GRADE_8=c(3, 4, 5, 6, 7, 8))
SGPstateData[["AZ"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
    ELA_GRADE_3=rep("ELA", 6),
    ELA_GRADE_4=rep("ELA", 6),
    ELA_GRADE_5=rep("ELA", 6),
    ELA_GRADE_6=rep("ELA", 6),
    ELA_GRADE_7=rep("ELA", 6),
    ELA_GRADE_8=rep("ELA", 6),
    ELA_GRADE_10=rep("ELA", 7),
    MATHEMATICS_GRADE_3=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_4=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_5=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_6=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_7=rep("MATHEMATICS", 6),
    MATHEMATICS_GRADE_8=rep("MATHEMATICS", 6))
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

###   Run analysis

Arizona_SGP <- abcSGP(
        Arizona_SGP,
        years = "2021", # need to add years now (after adding 2019 baseline projections).  Why?
        steps=c("prepareSGP", "analyzeSGP", "combineSGP"),
        sgp.config=AZ_CONFIG,
        sgp.percentiles=FALSE,
        sgp.projections=FALSE,
        sgp.projections.lagged=FALSE,
        sgp.percentiles.baseline=FALSE,
        sgp.projections.baseline=TRUE,
        sgp.projections.lagged.baseline=FALSE,
        sgp.target.scale.scores=TRUE,
        outputSGP.directory=output.directory,
        parallel.config=parallel.config
)

###   Save results
save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
