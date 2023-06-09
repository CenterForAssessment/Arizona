####################################################################
###
### Data prep of 2023 data
###
####################################################################

### Load packages
require(data.table)

### Load data
Arizona_Data_LONG <- fread("Data/Base_Files/Arizona_Data_LONG_060523.csv")
load("Data/Archive/Pre_2023/Arizona_SGP.Rdata")

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

### Create 2023 Data set
Arizona_Data_LONG_2023 <- Arizona_Data_LONG[YEAR=="2023"]
save(Arizona_Data_LONG_2023, file="Data/Arizona_Data_LONG_2023.Rdata")

### Create new SGP object
tmp.data <- Arizona_SGP@Data[YEAR >= "2021"]
Arizona_Data_LONG_2021_and_2022 <- Arizona_Data_LONG[YEAR < "2023"]
variables.to.keep <- c("VALID_CASE", "CONTENT_AREA", "YEAR", "GRADE", "ID", setdiff(names(tmp.data), names(Arizona_Data_LONG_2021_and_2022)))
tmp.data.for.sgp.object <- tmp.data[,variables.to.keep, with=FALSE][Arizona_Data_LONG_2021_and_2022]
setcolorder(tmp.data.for.sgp.object, c(1:5, 60:72, 10, 13:14, 8:9, 7, 11:12, 15:59, 73:77, 6))
Arizona_SGP@Data <- rbindlist(list(tmp.data.for.sgp.object, Arizona_SGP@Data[YEAR <= "2019"]), use.names=TRUE)
Arizona_SGP <- SGP::prepareSGP(Arizona_SGP)

### Save results
save(Arizona_SGP, file="Data/Arizona_SGP.Rdata")
save(Arizona_Data_LONG_2023, file="Data/Arizona_Data_LONG_2023.Rdata")