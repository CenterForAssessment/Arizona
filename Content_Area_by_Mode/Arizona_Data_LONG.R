##############################################################
###
### Script for creating Arizona_Data_LONG
###
##############################################################

### Load SGP and data.table

require(SGP)
require(data.table)


### Load data

Arizona_Data_LONG <- fread("Data/Base_Files/ArizonaData1516.txt", colClasses=rep("character", 10))


##########################################################
### Clean up 2015-2016 data
##########################################################

Arizona_Data_LONG[CONTENT_AREA=="English Language Arts",CONTENT_AREA:="ELA"]
Arizona_Data_LONG[CONTENT_AREA=="Mathematics",CONTENT_AREA:="MATHEMATICS"]
Arizona_Data_LONG[AssessmentSubtestTitle=="Algebra I", CONTENT_AREA:="ALGEBRA_I"]
Arizona_Data_LONG[AssessmentSubtestTitle=="Geometry", CONTENT_AREA:="GEOMETRY"]
Arizona_Data_LONG[AssessmentSubtestTitle=="Algebra II", CONTENT_AREA:="ALGEBRA_II"]
Arizona_Data_LONG[,CONTENT_AREA:=paste(CONTENT_AREA, TEST_MODE, sep="_")]
Arizona_Data_LONG[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
Arizona_Data_LONG[,VALID_CASE:="VALID_CASE"]


### Resolve duplicates

setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE, SCALE_SCORE)
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID)
Arizona_Data_LONG[which(duplicated(Arizona_Data_LONG, by=key(Arizona_Data_LONG)))-1, VALID_CASE:="INVALID_CASE"]
Arizona_Data_LONG[is.na(SCALE_SCORE), VALID_CASE:="INVALID_CASE"]
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, ID)


### Save results

save(Arizona_Data_LONG, file="Data/Arizona_Data_LONG.Rdata")
