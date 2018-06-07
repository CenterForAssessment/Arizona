##############################################################
###
### Script for creating Arizona_Data_LONG 2018
###
##############################################################

### Load SGP and data.table

require(SGP)
require(data.table)


### Load data

load("Data/Base_Files/Arizona_Data_LONG_060618.Rdata")
Arizona_Data_LONG_2018 <- Arizona_Data_LONG[YEAR=="2018"]


##########################################################
### Clean up 2018 data
##########################################################

## ETHNICITY

Arizona_Data_LONG_2018[ETHNICITY=="", ETHNICITY:="Unknown"]

## GRADE

setnames(Arizona_Data_LONG_2018, "GRADE", "GRADE_ENROLLED")
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 3", GRADE:="3"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 4", GRADE:="4"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 5", GRADE:="5"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 6", GRADE:="6"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 7", GRADE:="7"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 8", GRADE:="8"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 9", GRADE:="9"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 10", GRADE:="10"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="ELA Grade 11", GRADE:="11"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="Mathematics Grade 3", GRADE:="3"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="Mathematics Grade 4", GRADE:="4"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="Mathematics Grade 5", GRADE:="5"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="Mathematics Grade 6", GRADE:="6"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="Mathematics Grade 7", GRADE:="7"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle=="Mathematics Grade 8", GRADE:="8"]
Arizona_Data_LONG_2018[AssessmentSubtestTitle %in% c("Algebra I", "Algebra II", "Geometry"), GRADE:="EOCT"]

## SCALE_SCORE

Arizona_Data_LONG_2018[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
Arizona_Data_LONG_2018[SCALE_SCORE==0, SCALE_SCORE:=NA]


## ACHIEVEMENT_LEVEL

Arizona_Data_LONG_2018[ACHIEVEMENT_LEVEL=="", ACHIEVEMENT_LEVEL:=as.character(NA)]

## ENROLLMENT_STATUS

Arizona_Data_LONG_2018[,STATE_ENROLLMENT_STATUS:=factor(1, levels=0:1, labels=c("Enrolled State: No", "Enrolled State: Yes"))]
Arizona_Data_LONG_2018[,DISTRICT_ENROLLMENT_STATUS:=as.factor(DISTRICT_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_2018[['DISTRICT_ENROLLMENT_STATUS']], "levels", c("Enrolled District: No", "Enrolled District: Yes"))
Arizona_Data_LONG_2018[,SCHOOL_ENROLLMENT_STATUS:=as.factor(SCHOOL_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_2018[['SCHOOL_ENROLLMENT_STATUS']], "levels", c("Enrolled School: No", "Enrolled School: Yes"))


## VALID_CASE

Arizona_Data_LONG_2018[,VALID_CASE:="VALID_CASE"]


### Resolve duplicates


setkey(Arizona_Data_LONG_2018, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE, SCALE_SCORE)
setkey(Arizona_Data_LONG_2018, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE)


### Does -1 mean descending order? It seems that the program sorted the cases by SCALE_SCORE in descending order, and kept the highest score.

Arizona_Data_LONG_2018[which(duplicated(Arizona_Data_LONG, by=key(Arizona_Data_LONG)))-1, VALID_CASE:="INVALID_CASE"]
Arizona_Data_LONG_2018[is.na(SCALE_SCORE), VALID_CASE:="INVALID_CASE"]
setkey(Arizona_Data_LONG_2018, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE)


### Save results


save(Arizona_Data_LONG_2018, file="Data/Arizona_Data_LONG_2018.Rdata")
