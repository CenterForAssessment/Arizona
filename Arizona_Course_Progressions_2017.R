################################################################################
###                                                                          ###
###             Identify Potential 2017 Progressions for Arizona             ###
###                                                                          ###
################################################################################


library(SGP)
library(data.table)


load("Data/Arizona_Data_LONG.Rdata")
#load("I:/Accountability/Xiaoyuan/SGP2017/data/Arizona_Data_LONG.Rdata")




###############################
###                         ###
###       MATHEMATICS       ###
###                         ###
###############################


AZ_MATH<- Arizona_Data_LONG[CONTENT_AREA %in% c("ALGEBRA_I",  "ALGEBRA_II", "GEOMETRY", "MATHEMATICS")]
math.prog <- courseProgressionSGP(AZ_MATH, lag.direction="BACKWARD", year="2017")
table(AZ_MATH[YEAR=="2017", CONTENT_AREA, GRADE])


##    Algebra I


math.prog$BACKWARD[["2017"]][["ALGEBRA_I.CT"]][COUNT>500]


##    Geometry


math.prog$BACKWARD[["2017"]][["GEOMETRY.CT"]][COUNT>500]


##    Algebra II


math.prog$BACKWARD[["2017"]][["ALGEBRA_II.CT"]][COUNT>500]

##   Mathematics

math.prog$BACKWARD[["2017"]][["MATHEMATICS.08"]][COUNT>500]

math.prog$BACKWARD[["2017"]][["MATHEMATICS.07"]][COUNT>500]

math.prog$BACKWARD[["2017"]][["MATHEMATICS.06"]][COUNT>500]

math.prog$BACKWARD[["2017"]][["MATHEMATICS.05"]][COUNT>500]

math.prog$BACKWARD[["2017"]][["MATHEMATICS.04"]][COUNT>500]

math.prog$BACKWARD[["2017"]][["MATHEMATICS.03"]][COUNT>500]


###########################
###                     ###
###         ELA         ###
###                     ###
###########################

AZ_ELA <- Arizona_Data_LONG[CONTENT_AREA %in% c("ELA")]
table(AZ_ELA[YEAR=="2017", CONTENT_AREA, GRADE])


ela.prog <- courseProgressionSGP(AZ_ELA, lag.direction="BACKWARD", year="2017")

ela.prog$BACKWARD[["2017"]][["ELA.11"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.10"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.09"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.08"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.07"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.06"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.05"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.04"]][COUNT>500]

ela.prog$BACKWARD[["2017"]][["ELA.03"]][COUNT>500]
