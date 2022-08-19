#########################################################################################
###                                                                                   ###
###          Arizona 2019 consecutive-year BASELINE SGP analyses                      ###
###          NOTE: Doing this in 2022 thus the file name                              ###
###                                                                                   ###
#########################################################################################

###   Load packages
require(SGP)
require(data.table)
require(SGPmatrices)

###   Load data
load("Data/Arizona_SGP.Rdata")

###   Add Baseline matrices to SGPstateData
SGPstateData <- addBaselineMatrices("AZ", "2021")
SGPstateData[["AZ"]][["Assessment_Program_Information"]][["CSEM"]] <- NULL

###   Rename the skip-year SGP variables and objects

##    We can simply rename the BASELINE variables. We only have 2019/21 skip yr
# table(Arizona_SGP@Data[!is.na(SGP_BASELINE),
#         .(CONTENT_AREA, YEAR), GRADE], exclude = NULL)
baseline.names <- grep("BASELINE", names(Arizona_SGP@Data), value = TRUE)
setnames(Arizona_SGP@Data,
         baseline.names,
         paste0(baseline.names, "_SKIP_YEAR"))

sgps.2019 <- grep(".2019.BASELINE", names(Arizona_SGP@SGP[["SGPercentiles"]]))
names(Arizona_SGP@SGP[["SGPercentiles"]])[sgps.2019] <-
    gsub(".2019.BASELINE",
         ".2019.SKIP_YEAR_BLINE",
         names(Arizona_SGP@SGP[["SGPercentiles"]])[sgps.2019])


###   Read in SGP Configuration Scripts and Combine
source("SGP_CONFIG/2022/PART_A/ELA.R")
source("SGP_CONFIG/2022/PART_A/MATHEMATICS.R")

AZ_Baseline_Config_2019 <- c(
  ELA_2019.config,
  MATHEMATICS_2019.config
)

###   Parallel Config
parallel.config <- list(BACKEND = "PARALLEL",
                        WORKERS = list(BASELINE_PERCENTILES = 8))


#####
###   Run abcSGP analysis
#####

Arizona_SGP <-
    abcSGP(sgp_object = Arizona_SGP,
           years = "2019",
           steps = c("prepareSGP", "analyzeSGP", "combineSGP"),
           sgp.config = AZ_Baseline_Config_2019,
           sgp.percentiles = FALSE,
           sgp.projections = FALSE,
           sgp.projections.lagged = FALSE,
           sgp.percentiles.baseline = TRUE,
           sgp.projections.baseline = FALSE,
           sgp.projections.lagged.baseline = FALSE,
           simulate.sgps = FALSE,
           parallel.config = parallel.config)

###   Save results
#save(Arizona_SGP, file = "Data/Arizona_SGP.Rdata")
