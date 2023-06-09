################################################################################
###                                                                          ###
###                Arizona COVID Skip-year SGP analyses for 2021             ###
###                                                                          ###
################################################################################

###   Load packages
require(SGP)
require(SGPmatrices)

###   Load data
load("Data/Arizona_SGP.Rdata")
load("Data/Arizona_Data_LONG_2021.Rdata")

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2021")

###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2021/PART_A/ELA.R")
source("SGP_CONFIG/2021/PART_A/MATHEMATICS.R")
source("SGP_CONFIG/2021/PART_A/ELA_BASELINE.R")
source("SGP_CONFIG/2021/PART_A/MATHEMATICS_BASELINE.R")

AZ_CONFIG <- c(ELA_2021.config, MATHEMATICS_2021.config)
AZ_CONFIG_BASELINE <- c(ELA_BASELINE_2021.config, MATHEMATICS_BASELINE_2021.config)

### Parameters
parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4))

#####
###   Run updateSGP analysis and create cohort referenced SGPs
#####

Arizona_SGP <- updateSGP(
        what_sgp_object = Arizona_SGP,
        with_sgp_data_LONG = Arizona_Data_LONG_2021,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
        sgp.config = AZ_CONFIG,
        sgp.percentiles = TRUE,
        sgp.projections = FALSE,
        sgp.projections.lagged = FALSE,
        sgp.percentiles.baseline = FALSE,
        sgp.projections.baseline = FALSE,
        sgp.projections.lagged.baseline = FALSE,
        save.intermediate.results = FALSE,
        parallel.config = parallel.config
)


#####
###   Run abcSGP analysis and create baseline referenced SGPs
#####

Arizona_SGP <- abcSGP(
        sgp_object = Arizona_SGP,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
        sgp.config = AZ_CONFIG_BASELINE,
        sgp.percentiles = FALSE,
        sgp.projections = FALSE,
        sgp.projections.lagged = FALSE,
        sgp.percentiles.baseline = TRUE,
        sgp.projections.baseline = FALSE,
        sgp.projections.lagged.baseline = FALSE,
        save.intermediate.results = FALSE,
        parallel.config = parallel.config
)



### Copy SCALE_SCORE_PRIOR and SCALE_SCORE_PRIOR_STANDARDIZED to BASELINE counter parts
Arizona_SGP@Data[YEAR=="2021", SCALE_SCORE_PRIOR_BASELINE:=SCALE_SCORE_PRIOR]
Arizona_SGP@Data[YEAR=="2021", SCALE_SCORE_PRIOR_STANDARDIZED_BASELINE:=SCALE_SCORE_PRIOR_STANDARDIZED]

###   Save results
save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
