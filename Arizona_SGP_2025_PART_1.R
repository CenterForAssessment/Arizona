######################################################################################
###                                                                                ###
###                Arizona SGP INITIAL analyses for 2025                           ###
###                August 2025 update with updated 2025 data                       ###
###                                                                                ###
######################################################################################

###   Load packages
require(SGP)
require(SGPmatrices)

### Load SGP object data
load("Data/Arizona_SGP.Rdata")
load("Data/Arizona_Data_LONG_2025.Rdata")

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2025")

###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2025/ELA.R")
source("SGP_CONFIG/2025/ELA_BASELINE.R")
source("SGP_CONFIG/2025/MATHEMATICS.R")
source("SGP_CONFIG/2025/MATHEMATICS_BASELINE.R")

AZ_CONFIG <- c(ELA_2025.config, MATHEMATICS_2025.config)
AZ_CONFIG_BASELINE <- c(ELA_2025_BASELINE.config, MATHEMATICS_2025_BASELINE.config)

### Parameters
#parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4))
parallel.config <- NULL

#####
###   Run cohort-referenced abcSGP analysis
#####

Arizona_SGP <- updateSGP(
        what_sgp_object = Arizona_SGP,
        with_sgp_data_LONG = Arizona_Data_LONG_2025,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
        sgp.config = AZ_CONFIG,
        sgp.percentiles = TRUE,
        sgp.projections = TRUE,
        sgp.projections.lagged = TRUE,
        sgp.percentiles.baseline = FALSE,
        sgp.projections.baseline = FALSE,
        sgp.projections.lagged.baseline = FALSE,
        save.intermediate.results = FALSE,
        parallel.config = parallel.config
)


#####
###   Run baseline-referenced abcSGP analysis
#####

SGPstateData[["AZ"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
	ELA=c("3", "4", "5", "6", "7", "8"),
	MATHEMATICS=c("3", "4", "5", "6", "7", "8"))
SGPstateData[["AZ"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
	ELA=rep("ELA", 6),
	MATHEMATICS=rep("MATHEMATICS", 6))
SGPstateData[["AZ"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
	ELA=rep(1L, 5),
	MATHEMATICS=rep(1L, 5))


Arizona_SGP <- abcSGP(
        sgp_object = Arizona_SGP,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
        sgp.config = AZ_CONFIG_BASELINE,
        sgp.percentiles = FALSE,
        sgp.projections = FALSE,
        sgp.projections.lagged = FALSE,
        sgp.percentiles.baseline = TRUE,
        sgp.projections.baseline = TRUE,
        sgp.projections.lagged.baseline = TRUE,
        save.intermediate.results = FALSE,
        parallel.config = parallel.config
)

###   Save results
save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
