##############################################################
###
### Script for creating Arizona_Data_LONG 2022
###
##############################################################

### Load SGP and data.table
require(SGP)
require(data.table)


### Load data
#load("Data/Base_Files/Arizona_Data_LONG_081022.Rdata")
#load("Data/Base_Files/Arizona_Data_LONG_081622.Rdata")
load("Data/Base_Files/Arizona_Data_LONG_081922.Rdata")
Arizona_Data_LONG_2022 <- Arizona_Data_LONG

### Minor tidying up
Arizona_Data_LONG_2022[,GRADE_ENROLLED:=as.character(as.integer(GRADE_ENROLLED))]
Arizona_Data_LONG_2022[,FREE_REDUCED_LUNCH_STATUS:=as.character(as.integer(FREE_REDUCED_LUNCH_STATUS))]
Arizona_Data_LONG_2022[,SPED_STATUS:=as.character(as.integer(SPED_STATUS))]

### No duplicates 
#table(duplicated(Arizona_Data_LONG_2022, by=key(Arizona_Data_LONG_2022)))

### Save results
save(Arizona_Data_LONG_2022, file="Data/Arizona_Data_LONG_2022.Rdata")
