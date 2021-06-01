################################################################################
###                                                                          ###
###       Arizona Learning Loss Analyses -- Create Baseline Matrices         ###
###                                                                          ###
################################################################################

### Load necessary packages
require(SGP)

###   Load the results data from the 'official' 2019 SGP analyses
load("Data/Arizona_SGP_LONG_Data.Rdata")

###   Create a smaller subset of the LONG data to work with.
Arizona_Baseline_Data <- data.table::data.table(Arizona_SGP_LONG_Data[, c("VALID_CASE", "CONTENT_AREA", "YEAR", "ID", "GRADE", "SCALE_SCORE", "ACHIEVEMENT_LEVEL"),])

###   Read in Baseline SGP Configuration Scripts and Combine
source("SGP_CONFIG/2019/BASELINE/Matrices/ELA.R")
source("SGP_CONFIG/2019/BASELINE/Matrices/MATHEMATICS.R")

AZ_BASELINE_CONFIG <- c(
	ELA_BASELINE.config,
	MATHEMATICS_BASELINE.config
)

###
###   Create Baseline Matrices

Arizona_SGP <- prepareSGP(Arizona_Baseline_Data, create.additional.variables=FALSE)

AZ_Baseline_Matrices <- baselineSGP(
				Arizona_SGP,
				sgp.baseline.config=AZ_BASELINE_CONFIG,
				return.matrices.only=TRUE,
				calculate.baseline.sgps=FALSE,
				goodness.of.fit.print=FALSE,
				parallel.config = list(
					BACKEND="PARALLEL", WORKERS=list(TAUS=7))
)

###   Save results
save(AZ_Baseline_Matrices, file="Data/AZ_Baseline_Matrices.Rdata")
