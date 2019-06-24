##############################################################
###
### Script for creating Arizona_Data_LONG 2019
###
##############################################################

### Load SGP and data.table

require(SGP)
require(data.table)


### Load data

load("Data/Base_Files/Arizona_Data_LONG_062419.Rdata")
Arizona_Data_LONG_2019_ALL_YEARS <- Arizona_Data_LONG


### Save results

save(Arizona_Data_LONG_2019_ALL_YEARS, file="Data/Arizona_Data_LONG_2019_ALL_YEARS.Rdata")
