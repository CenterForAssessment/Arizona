##############################################################
###
### Script for creating Arizona_Data_LONG
###
##############################################################


### Load SGP and data.table


require(SGP)
require(data.table)




### Load data


Arizona_Data_LONG_151617 <- fread("Data/Base_Files/sgpdata151617.txt", colClasses=rep("character", 21))
#Arizona_Data_LONG_151617 <- fread("I:/Accountability/Xiaoyuan/SGP2017/data/sgpdata151617.txt", colClasses=rep("character", 21))




##########################################################
### Clean up 2013, 2014, 2015, and 2016 data
##########################################################


## CONTENT_AREA


Arizona_Data_LONG_151617[CONTENT_AREA=="English Language Arts",CONTENT_AREA:="ELA"]
Arizona_Data_LONG_151617[CONTENT_AREA=="Mathematics",CONTENT_AREA:="MATHEMATICS"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Algebra I", CONTENT_AREA:="ALGEBRA_I"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Geometry", CONTENT_AREA:="GEOMETRY"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Algebra II", CONTENT_AREA:="ALGEBRA_II"]


## GRADE


setnames(Arizona_Data_LONG_151617, "GRADE", "GRADE_ENROLLED")
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 3", GRADE:="3"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 4", GRADE:="4"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 5", GRADE:="5"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 6", GRADE:="6"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 7", GRADE:="7"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 8", GRADE:="8"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 9", GRADE:="9"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 10", GRADE:="10"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="ELA Grade 11", GRADE:="11"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Mathematics Grade 3", GRADE:="3"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Mathematics Grade 4", GRADE:="4"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Mathematics Grade 5", GRADE:="5"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Mathematics Grade 6", GRADE:="6"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Mathematics Grade 7", GRADE:="7"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle=="Mathematics Grade 8", GRADE:="8"]
Arizona_Data_LONG_151617[AssessmentSubtestTitle %in% c("Algebra I", "Algebra II", "Geometry"), GRADE:="EOCT"]




## SCALE_SCORE


Arizona_Data_LONG_151617[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
Arizona_Data_LONG_151617[SCALE_SCORE==0, SCALE_SCORE:=NA]




## ACHIEVEMENT_LEVEL

Arizona_Data_LONG_151617[ACHIEVEMENT_LEVEL=="", ACHIEVEMENT_LEVEL:=as.character(NA)]

## ENROLLMENT_STATUS


Arizona_Data_LONG_151617[,STATE_ENROLLMENT_STATUS:=factor(1, levels=0:1, labels=c("Enrolled State: No", "Enrolled State: Yes"))]
Arizona_Data_LONG_151617[,DISTRICT_ENROLLMENT_STATUS:=as.factor(DISTRICT_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_151617[['DISTRICT_ENROLLMENT_STATUS']], "levels", c("Enrolled District: No", "Enrolled District: Yes"))
Arizona_Data_LONG_151617[,SCHOOL_ENROLLMENT_STATUS:=as.factor(SCHOOL_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_151617[['SCHOOL_ENROLLMENT_STATUS']], "levels", c("Enrolled School: No", "Enrolled School: Yes"))




## rbind data if any data.table misses any columns that the second data.table has, these columns will be added to the data.table as missing columns 'fill=TRUE')


Arizona_Data_LONG <- Arizona_Data_LONG_151617



## VALID_CASE


Arizona_Data_LONG[,VALID_CASE:="VALID_CASE"]




### Resolve duplicates


setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE, SCALE_SCORE)
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE)

### Does -1 mean descending order? It seems that the program sorted the cases by SCALE_SCORE in descending order, and kept the highest score.

Arizona_Data_LONG[which(duplicated(Arizona_Data_LONG, by=key(Arizona_Data_LONG)))-1, VALID_CASE:="INVALID_CASE"]
Arizona_Data_LONG[is.na(SCALE_SCORE), VALID_CASE:="INVALID_CASE"]
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE)




### Save results


save(Arizona_Data_LONG, file="Data/Arizona_Data_LONG.Rdata")
#save(Arizona_Data_LONG, file="I:/Accountability/Xiaoyuan/SGP2017/data/Arizona_Data_LONG.Rdata")
