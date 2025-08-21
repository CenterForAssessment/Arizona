####################################################################
###
### Data prep of 2025 data
###
####################################################################

### Load packages
require(data.table)

### Load data
#Arizona_Data_LONG_2025 <- fread("Data/Base_Files/Arizona_Data_LONG_061325.csv")
Arizona_Data_LONG_2025 <- fread("Data/Base_Files/Arizona_Data_LONG_081825.csv")

### Tidy up Arizona_Data_LONG_2025
Arizona_Data_LONG_2025[,ID:=as.character(ID)]
Arizona_Data_LONG_2025[,YEAR:=as.character(YEAR)]
Arizona_Data_LONG_2025[,ACHIEVEMENT_LEVEL:=as.factor(ACHIEVEMENT_LEVEL)]
setattr(Arizona_Data_LONG_2025$ACHIEVEMENT_LEVEL, "levels", c("Minimally Proficient", "Partially Proficient", "Proficient", "Highly Proficient"))
Arizona_Data_LONG_2025[,ACHIEVEMENT_LEVEL:=as.character(ACHIEVEMENT_LEVEL)]
Arizona_Data_LONG_2025[,GRADE_ENROLLED:=as.character(GRADE_ENROLLED)]
Arizona_Data_LONG_2025[,GRADE:=GRADE_ENROLLED]
Arizona_Data_LONG_2025[,SCHOOL_ENROLLMENT_STATUS:=as.factor(SCHOOL_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_2025$SCHOOL_ENROLLMENT_STATUS, "levels", c("Enrolled School: No", "Enrolled School: Yes"))
Arizona_Data_LONG_2025[,DISTRICT_ENROLLMENT_STATUS:=as.factor(DISTRICT_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG_2025$DISTRICT_ENROLLMENT_STATUS, "levels", c("Enrolled District: No", "Enrolled District: Yes"))
Arizona_Data_LONG_2025[,VALID_CASE:="VALID_CASE"]
Arizona_Data_LONG_2025[CONTENT_AREA=="MATH", CONTENT_AREA:="MATHEMATICS"]
setcolorder(Arizona_Data_LONG_2025, c(23, 7, 2, 22, 1, 10, 8, 3:6, 11:12, 15:19, 20, 21, 9, 13:14))
setkey(Arizona_Data_LONG_2025, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID)

### Save 2025 Data set
save(Arizona_Data_LONG_2025, file="Data/Arizona_Data_LONG_2025.Rdata")
