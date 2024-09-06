####################################################################
###
### Data prep of 2024 data
###
####################################################################

### Load packages
require(data.table)

### Load data
#Arizona_Data_LONG <- fread("Data/Base_Files/Arizona_Data_LONG_061824.csv")
Arizona_Data_LONG <- fread("Data/Base_Files/Arizona_Data_LONG_082024.csv")
load("Data/Arizona_SGP.Rdata")

### Tidy up Arizona_Data_LONG
Arizona_Data_LONG[,ID:=as.character(ID)]
Arizona_Data_LONG[,YEAR:=as.character(YEAR)]
Arizona_Data_LONG[,ACHIEVEMENT_LEVEL:=as.factor(ACHIEVEMENT_LEVEL)]
setattr(Arizona_Data_LONG$ACHIEVEMENT_LEVEL, "levels", c("Minimally Proficient", "Partially Proficient", "Proficient", "Highly Proficient"))
Arizona_Data_LONG[,ACHIEVEMENT_LEVEL:=as.character(ACHIEVEMENT_LEVEL)]
Arizona_Data_LONG[,GRADE_ENROLLED:=as.character(GRADE_ENROLLED)]
Arizona_Data_LONG[,GRADE:=GRADE_ENROLLED]
Arizona_Data_LONG[,SCHOOL_ENROLLMENT_STATUS:=as.factor(SCHOOL_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG$SCHOOL_ENROLLMENT_STATUS, "levels", c("Enrolled School: No", "Enrolled School: Yes"))
Arizona_Data_LONG[,DISTRICT_ENROLLMENT_STATUS:=as.factor(DISTRICT_ENROLLMENT_STATUS)]
setattr(Arizona_Data_LONG$DISTRICT_ENROLLMENT_STATUS, "levels", c("Enrolled District: No", "Enrolled District: Yes"))
Arizona_Data_LONG[,VALID_CASE:="VALID_CASE"]
Arizona_Data_LONG[CONTENT_AREA=="MATH", CONTENT_AREA:="MATHEMATICS"]
setcolorder(Arizona_Data_LONG, c(23, 7, 2, 22, 1, 10, 8, 3:6, 11:12, 15:19, 20, 21, 9, 13:14))
setkey(Arizona_Data_LONG, VALID_CASE, CONTENT_AREA, YEAR, GRADE, ID)

### Create 2024 Data set
Arizona_Data_LONG_2024 <- Arizona_Data_LONG[YEAR=="2024"]
Arizona_Data_LONG_2021 <- Arizona_SGP@Data[YEAR=="2021", names(Arizona_Data_LONG), with=FALSE]
save(Arizona_Data_LONG_2024, file="Data/Arizona_Data_LONG_2024.Rdata")
Arizona_Data_LONG_2021_to_2024 <- rbindlist(list(Arizona_Data_LONG_2021, Arizona_Data_LONG))
save(Arizona_Data_LONG_2021_to_2024, file="Data/Arizona_Data_LONG_2021_to_2024.Rdata")
