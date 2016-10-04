##############################################################
###
### Script for creating Arizona_Data_LONG_1516
###
##############################################################

### Load SGP and data.table

require(SGP)
require(data.table)


### Load data

Arizona_Data_LONG_1516 <- fread("Data/Base_Files/ArizonaData1516.txt", colClasses=rep("character", 12))
Arizona_Data_LONG_1314 <- fread("Data/Base_Files/ArizonaData1314.txt", colClasses=rep("character", 10))


##########################################################
### Clean up 2015-2016 data
##########################################################

## CONTENT_AREA

Arizona_Data_LONG_1516[CONTENT_AREA=="English Language Arts",CONTENT_AREA:="ELA"]
Arizona_Data_LONG_1516[CONTENT_AREA=="Mathematics",CONTENT_AREA:="MATHEMATICS"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Algebra I", CONTENT_AREA:="ALGEBRA_I"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Geometry", CONTENT_AREA:="GEOMETRY"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Algebra II", CONTENT_AREA:="ALGEBRA_II"]
Arizona_Data_LONG_1516[,CONTENT_AREA:=paste(CONTENT_AREA, TEST_MODE, sep="_")]

## GRADE

setnames(Arizona_Data_LONG_1516, "GRADE", "GRADE_ENROLLED")
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 3", GRADE:="3"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 4", GRADE:="4"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 5", GRADE:="5"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 6", GRADE:="6"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 7", GRADE:="7"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 8", GRADE:="8"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 9", GRADE:="9"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 10", GRADE:="10"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="ELA Grade 11", GRADE:="11"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Mathematics Grade 3", GRADE:="3"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Mathematics Grade 4", GRADE:="4"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Mathematics Grade 5", GRADE:="5"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Mathematics Grade 6", GRADE:="6"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Mathematics Grade 7", GRADE:="7"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle=="Mathematics Grade 8", GRADE:="8"]
Arizona_Data_LONG_1516[AssessmentSubtestTitle %in% c("Algebra I", "Algebra II", "Geometry"), GRADE:="EOCT"]

## SCALE_SCORE

Arizona_Data_LONG_1314[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
Arizona_Data_LONG_1314[SCALE_SCORE==0, SCALE_SCORE:=NA]
Arizona_Data_LONG_1516[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]

## ACHIEVEMENT_LEVEL

Arizona_Data_LONG_1314[ACHIEVEMENT_LEVEL=="", ACHIEVEMENT_LEVEL:=as.character(NA)]

# ENROLLMENT_STATUS

Arizona_Data_LONG_1314[,STATE_ENROLLMENT_STATUS:=factor(1, levels=0:1, labels=c("Enrolled State: No", "Enrolled State: Yes"))]
Arizona_Data_LONG_1516[,STATE_ENROLLMENT_STATUS:=factor(1, levels=0:1, labels=c("Enrolled State: No", "Enrolled State: Yes"))]
Arizona_Data_LONG_1314[,DISTRICT_ENROLLMENT_STATUS:=as.factor(DISTRICT_ENROLLMENT_STATUS)]
Arizona_Data_LONG_1516[,DISTRICT_ENROLLMENT_STATUS:=as.factor(DISTRICT_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_1314[['DISTRICT_ENROLLMENT_STATUS']], "levels", c("Enrolled District: No", "Enrolled District: Yes"))
setattr(Arizona_Data_LONG_1516[['DISTRICT_ENROLLMENT_STATUS']], "levels", c("Enrolled District: No", "Enrolled District: Yes"))
Arizona_Data_LONG_1314[,SCHOOL_ENROLLMENT_STATUS:=as.factor(SCHOOL_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_1314[['SCHOOL_ENROLLMENT_STATUS']], "levels", c("Enrolled School: No", "Enrolled School: Yes"))
Arizona_Data_LONG_1516[,SCHOOL_ENROLLMENT_STATUS:=as.factor(SCHOOL_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_1516[['SCHOOL_ENROLLMENT_STATUS']], "levels", c("Enrolled School: No", "Enrolled School: Yes"))

## rbind data

Arizona_Data_LONG <- rbindlist(list(Arizona_Data_LONG_1314, Arizona_Data_LONG_1516), fill=TRUE)

## VALID_CASE

Arizona_Data_LONG[,VALID_CASE:="VALID_CASE"]

### Resolve duplicates

setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE, SCALE_SCORE)
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID)
Arizona_Data_LONG[which(duplicated(Arizona_Data_LONG, by=key(Arizona_Data_LONG)))-1, VALID_CASE:="INVALID_CASE"]
Arizona_Data_LONG[is.na(SCALE_SCORE), VALID_CASE:="INVALID_CASE"]
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID)


### Save results

save(Arizona_Data_LONG, file="Data/Arizona_Data_LONG.Rdata")
