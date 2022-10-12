######################################################################################
###                                                                                ###
###                Arizona SGP analyses for 2022                                   ###
###                                                                                ###
######################################################################################

###   Load packages
require(SGP)
require(SGPmatrices)


###
### STEP 1: Calculate coefficient matrices from preliminary data

### Load SGP object data
load("Data/Arizona_SGP.Rdata")

### Load preliminary data
load("Data/Base_Files/Arizona_Data_LONG_082622.Rdata")
Arizona_Data_LONG_2022 <- Arizona_Data_LONG

### Minor tidying up
Arizona_Data_LONG_2022[,GRADE_ENROLLED:=as.character(as.integer(GRADE_ENROLLED))]
Arizona_Data_LONG_2022[,FREE_REDUCED_LUNCH_STATUS:=as.character(as.integer(FREE_REDUCED_LUNCH_STATUS))]
Arizona_Data_LONG_2022[,SPED_STATUS:=as.character(as.integer(SPED_STATUS))]

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2022")

###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2022/PART_B/ELA.R")
source("SGP_CONFIG/2022/PART_B/MATHEMATICS.R")

AZ_CONFIG <- c(ELA_2022.config, MATHEMATICS_2022.config)
AZ_CONFIG_BASELINE <- c(ELA_2022_BASELINE.config, MATHEMATICS_2022_BASELINE.config)

### Parameters
#parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4))
parallel.config <- list(BACKEND="PARALLEL", WORKERS=list(TAUS=48))

#####
###   Run cohort-referenced updateSGP analysis on preliminary data to create coefficient matrices
#####

Arizona_SGP <- updateSGP(
        what_sgp_object = Arizona_SGP,
        with_sgp_data_LONG = Arizona_Data_LONG_2022,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
        sgp.config = AZ_CONFIG,
        sgp.percentiles = TRUE,
        sgp.projections = FALSE,
        sgp.projections.lagged = FALSE,
        sgp.percentiles.baseline = FALSE,
        sgp.projections.baseline = FALSE,
        sgp.projections.lagged.baseline = FALSE,
        save.intermediate.results = FALSE,
        sgp.percentiles.calculate.sgps = FALSE,
        parallel.config = parallel.config
)

#####
###   Run cohort-referenced updateSGP analysis on final data with coefficient matrices
#####

### Load final data
load("Data/Base_Files/Arizona_Data_LONG_2022.Rdata")

Arizona_SGP <- updateSGP(
        what_sgp_object = Arizona_SGP,
        with_sgp_data_LONG = Arizona_Data_LONG_2022,
        steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
        sgp.config = AZ_CONFIG,
        sgp.percentiles = TRUE,
        sgp.projections = TRUE,
        sgp.projections.lagged = TRUE,
        sgp.percentiles.baseline = FALSE,
        sgp.projections.baseline = FALSE,
        sgp.projections.lagged.baseline = FALSE,
        save.intermediate.results = FALSE,
        sgp.use.my.coefficient.matrices = TRUE,
        parallel.config = parallel.config
)

#####
###   Run baseline-referenced updateSGP analysis
#####

Arizona_SGP <- abcSGP(
        sgp_object = Arizona_SGP,
	years="2022",
        steps = c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
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

###   Save results
save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
