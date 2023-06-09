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


### Resolve duplicates


setkey(Arizona_Data_LONG_2018, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE, SCALE_SCORE)
setkey(Arizona_Data_LONG_2018, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE)
Arizona_Data_LONG_2018[which(duplicated(Arizona_Data_LONG, by=key(Arizona_Data_LONG)))-1, VALID_CASE:="INVALID_CASE"]
setkey(Arizona_Data_LONG_2018, VALID_CASE, CONTENT_AREA, YEAR, ID, GRADE)


### Save results


save(Arizona_Data_LONG_2018, file="Data/Arizona_Data_LONG_2018.Rdata")
