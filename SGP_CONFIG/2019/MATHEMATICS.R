### MATHEMATICS 2019


MATHEMATICS_2019.config <- list(
     MATHEMATICS.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('4', '5', '6'), c('5', '6', '7')),
                 sgp.projection.sequence=c("MATHEMATICS", "ALGEBRA_I_FROM_7")),
     MATHEMATICS.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('6', '7', '8')),
                 sgp.projection.sequence=c("MATHEMATICS"))
)



### ALGEBRA I


ALGEBRA_I_2019.config <- list(
 	ALGEBRA_I.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('7', '8', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=1),
 	ALGEBRA_I.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2),
    ALGEBRA_I.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('6', '7', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="ALGEBRA_I_FROM_7",
                 sgp.norm.group.preference=1),
 	ALGEBRA_I.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('7', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2)
)




### GEOMETRY


GEOMETRY_2019.config <- list(
 	GEOMETRY.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=1),
    GEOMETRY.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="ALGEBRA_I_FROM_7",
                 sgp.norm.group.preference=1),
 	GEOMETRY.2019 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'GEOMETRY'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2),
    GEOMETRY.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'GEOMETRY'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('7', '8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=3),
    GEOMETRY.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'GEOMETRY'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=4),
 	GEOMETRY.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_II', 'GEOMETRY'),
                 sgp.panel.years=c('2017','2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
 		         sgp.norm.group.preference=4),
    GEOMETRY.2019 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'ALGEBRA_II', 'GEOMETRY'),
                 sgp.panel.years=c('2017','2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
 		         sgp.norm.group.preference=3),
 	GEOMETRY.2019 = list(
                 sgp.content.areas=c('ALGEBRA_II', 'GEOMETRY'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
 		         sgp.norm.group.preference=5)
)



### ALGEBRA II


ALGEBRA_II_2019.config <- list(
 	ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'GEOMETRY', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
 		         sgp.norm.group.preference=1),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=3),
 	ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017','2018', '2019'),
                 sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=4),
 	ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('GEOMETRY', 'ALGEBRA_II'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=4),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=4),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('GEOMETRY', 'ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017', '2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=4),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=5),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_II'),
                 sgp.panel.years=c('2017','2018', '2019'),
                 sgp.grade.sequences=list(c('7', '8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=2),
    ALGEBRA_II.2019 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_II'),
                 sgp.panel.years=c('2018', '2019'),
                 sgp.grade.sequences=list(c('8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=3)
)
