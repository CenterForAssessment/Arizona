################################################################################
###                                                                          ###
###             Identify Potential 2016 Progressions for Arizona             ###
###                                                                          ###
################################################################################

library(SGP)
library(data.table)

load("Arizona/Content_Area/Data/Arizona_Data_LONG.Rdata")


###                         ###
###       MATHEMATICS       ###
###                         ###

AZ_MATH<- Arizona_Data_LONG[CONTENT_AREA %in% c("ALGEBRA_I",  "ALGEBRA_II", "GEOMETRY", "MATHEMATICS")]
math.prog <- courseProgressionSGP(AZ_MATH, lag.direction="BACKWARD", year="2016")
table(AZ_MATH[YEAR=="2016", CONTENT_AREA, GRADE])

##    Algebra I

math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][COUNT>500] # Major progressions
table(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]]$CONTENT_AREA_by_GRADE_PRIOR_YEAR.1)

	###  Tenable Progressions
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.06"]$COUNT) #  2,563
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.07"]$COUNT) # 12,830
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.08"]$COUNT) # 52,567
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT"]$COUNT)    #  1,793 - Geom prior (out of expected sequence...)
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT"]$COUNT)   #  8,127 - repeaters (could add more priors with 2nd year as 8th OR 7th grade math - see below)
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][is.na(CONTENT_AREA_by_GRADE_PRIOR_YEAR.1) & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.08"]$COUNT) # 3,438 - Skipped year

	###  Untenable Progressions
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_II.CT"]$COUNT)  #  544 - regressors
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.05"]$COUNT) #  321 - geniuses
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][is.na(CONTENT_AREA_by_GRADE_PRIOR_YEAR.1) & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.09"]$COUNT) # 929 - Skipped year
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][is.na(CONTENT_AREA_by_GRADE_PRIOR_YEAR.1) & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.07"]$COUNT) # 981 - Skipped year

		####  Deeper dive into Algebra I Repeaters - Additional Priors / Seperate cohorts?
		sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.07"]$COUNT) # 2,932
		sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_I.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.08"]$COUNT) # 3,111
	
##    Geometry

math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][COUNT>500]

	###  Tenable Progressions
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.07"]$COUNT) #   2,411
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.08"]$COUNT) #  14,044
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT"]$COUNT)   #  56,463
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_II.CT"]$COUNT)  #   1,827
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT"]$COUNT)    #   3,081 (repeaters)

	###  Untenable Progressions
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.06"]$COUNT) # 464 - geniuses
	sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.05"]$COUNT) #  49 - bigger geniuses
	
		####  Deeper dive into Algebra I Leading Priors
		sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.07"]$COUNT) #  9,257
		sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.08"]$COUNT) # 38,383
	
		# - Borderline...
		sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.06"]$COUNT) #  2,146
		sum(math.prog$BACKWARD[["2016"]][["GEOMETRY.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.09"]$COUNT) #  2,106
		

##    Algebra II

math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][COUNT>500] # Major progressions

	###  Tenable Progressions
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.08"]$COUNT) #   3,138
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT"]$COUNT)    #  46,001
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_I.CT"]$COUNT)   #   6,015
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ALGEBRA_II.CT"]$COUNT)  #   3,138 (repeaters)

	###  Untenable Progressions
	sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATHEMATICS.07"]$COUNT) # 132

		####  Deeper dive into Geometry Leading Priors
		sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.08"]$COUNT) # 11,479
		sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.09"]$COUNT) # 28,104

		# - Borderline...
		sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.07"]$COUNT) #  1,599
		sum(math.prog$BACKWARD[["2016"]][["ALGEBRA_II.CT"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="GEOMETRY.CT" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="MATHEMATICS.10"]$COUNT) #  1,405
		


###                     ###
###         ELA         ###
###                     ###
		
AZ_ELA <- Arizona_Data_LONG[CONTENT_AREA %in% c("ELA", "READING")]
table(AZ_ELA[YEAR=="2016", CONTENT_AREA, GRADE])

ela.prog <- courseProgressionSGP(AZ_ELA, lag.direction="BACKWARD", year="2016")


##    9th Grade

sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.07"]$COUNT) #    167
sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08"]$COUNT) # 69,825
sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09"]$COUNT) #  2,281  (repeaters)
sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10"]$COUNT) #    798  (regressors)
sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.11"]$COUNT) #    455  (regressors - 2 grades)

	###  Deeper into 8th Grade leading prior
	sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.06"]$COUNT) #     71
	sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.07"]$COUNT) # 66,533
	sum(ela.prog$BACKWARD[["2016"]][["ELA.09"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.08"]$COUNT) #    185


##    10th Grade

sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08"]$COUNT) #    196
sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09"]$COUNT) # 61,660
sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10"]$COUNT) #    617  (repeaters)
sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.11"]$COUNT) #    630  (regressors)

	###  Deeper into 9th Grade leading prior
	sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.08"]$COUNT) # 57,269
	sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.09"]$COUNT) #    263
	sum(ela.prog$BACKWARD[["2016"]][["ELA.10"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.10"]$COUNT) #    116


##    11th Grade

	sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08"]$COUNT) #     66
	sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09"]$COUNT) #  1,326
	sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10"]$COUNT) # 54,904
	sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.11"]$COUNT) #  1,742 (repeaters)

	###  Deeper into 10th Grade leading prior
		sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.08"]$COUNT) #     97
		sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.09"]$COUNT) # 50,665
		sum(ela.prog$BACKWARD[["2016"]][["ELA.11"]][CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10" & CONTENT_AREA_by_GRADE_PRIOR_YEAR.2=="READING.10"]$COUNT) #    318
