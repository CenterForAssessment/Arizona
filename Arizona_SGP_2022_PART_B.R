######################################################################################
###                                                                                ###
###                Arizona SGP analyses for 2022                                   ###
###                                                                                ###
######################################################################################

###   Load packages
require(SGP)
require(SGPmatrices)

###   Load data
load("Data/Arizona_SGP.Rdata")
load("Data/Arizona_Data_LONG_2022.Rdata")

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2022")

###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2022/PART_B/ELA.R")
source("SGP_CONFIG/2022/PART_B/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2022.config, MATHEMATICS_2022.config)
AZ_CONFIG_BASELINE <- c(ELA_2022_BASELINE.config, MATHEMATICS_2022_BASELINE.config)

### Parameters
parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4))

#####
###   Run updateSGP analysis
#####

Arizona_SGP <- updateSGP(
        what_sgp_object = Arizona_SGP,
        with_sgp_data_LONG = Arizona_Data_LONG_2022,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
        sgp.config = NH_CONFIG,
        sgp.percentiles = TRUE,
        sgp.projections = TRUE,
        sgp.projections.lagged = TRUE,
        sgp.percentiles.baseline = TRUE,
        sgp.projections.baseline = TRUE,
        sgp.projections.lagged.baseline = TRUE,
        save.intermediate.results = FALSE,
        parallel.config = parallel.config
)


###   Save results
save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
