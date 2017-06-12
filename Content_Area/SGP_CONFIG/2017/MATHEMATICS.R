### MATHEMATICS 2017


MATHEMATICS_2017.config <- list(
     MATHEMATICS.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
#                 sgp.projection.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
                 sgp.panel.years=c('2015', '2016', '2017'),
#                 sgp.projection.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('4', '5', '6'), c('5', '6', '7'), c('6', '7', '8')),
#                 sgp.projection.grade.sequences=list('3', c('3', '4'), c('4', '5'), c('5', '6'), c('6', '7'), c('7', '8')),
                 sgp.projection.sequence="MATHEMATICS")
)



### ALGEBRA I


ALGEBRA_I_2017.config <- list(
 	ALGEBRA_I.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I'),
#                 sgp.projection.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
                 sgp.panel.years=c('2016', '2017'),
#                 sgp.projection.panel.years=c('2015', '2016', '2017'),
                 sgp.grade.sequences=list(c('7', '8', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('7', '8')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=1),
 	ALGEBRA_I.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I'),
#                 sgp.projection.content.areas=c('MATHEMATICS'),
                 sgp.panel.years=c('2016', '2017'),
#                 sgp.projection.panel.years=c('2017'),
                 sgp.grade.sequences=list(c('8', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('8')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2),
        ALGEBRA_I.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I'),
#                 sgp.projection.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
                 sgp.panel.years=c('2015', '2016', '2017'),
#                 sgp.projection.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('6', '7', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('6', '7')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=1),
 	ALGEBRA_I.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I'),
#                 sgp.projection.content.areas=c('MATHEMATICS'),
                 sgp.panel.years=c('2016', '2017'),
#                 sgp.projection.panel.years=c('2017'),
                 sgp.grade.sequences=list(c('7', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('7')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2)
)




### GEOMETRY


GEOMETRY_2017.config <- list(
 	GEOMETRY.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
#                 sgp.projection.content.areas=c('MATHEMATICS', 'ALGEBRA_I'),
                 sgp.panel.years=c('2015', '2016', '2017'),
#                 sgp.projection.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('8', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=1),
        GEOMETRY.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
#                 sgp.projection.content.areas=c('MATHEMATICS', 'ALGEBRA_I'),
                 sgp.panel.years=c('2015', '2016', '2017'),
#                 sgp.projection.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('7', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=1),
 	GEOMETRY.2017 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'GEOMETRY'),
#                 sgp.projection.content.areas=c('ALGEBRA_I'),
                 sgp.panel.years=c('2016', '2017'),
#                 sgp.projection.panel.years=c('2017'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2),
        GEOMETRY.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'GEOMETRY'),
                 sgp.panel.years=c('2015', '2016', '2017'),
                 sgp.grade.sequences=list(c('7', '8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1),
 	GEOMETRY.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_II', 'GEOMETRY'),
                 sgp.panel.years=c('2015','2016', '2017'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
 		 sgp.norm.group.preference=1),
        GEOMETRY.2017 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'ALGEBRA_II', 'GEOMETRY'),
                 sgp.panel.years=c('2015','2016', '2017'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c("NO_PROJECTIONS")),
                 sgp.exact.grade.progression=TRUE,
 		 sgp.norm.group.preference=1)
)



### ALGEBRA II


ALGEBRA_II_2017.config <- list(
 	ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'GEOMETRY', 'ALGEBRA_II'),
#                 sgp.projection.content.areas=c('ALGEBRA_I', 'GEOMETRY'),
                 sgp.panel.years=c('2015', '2016', '2017'),
#                 sgp.projection.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('EOCT', 'EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
 		         sgp.norm.group.preference=1),
        ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                 sgp.panel.years=c('2015', '2016', '2017'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1),
 	ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('GEOMETRY', 'ALGEBRA_II'),
#                 sgp.projection.content.areas=c('GEOMETRY'),
                 sgp.panel.years=c('2016', '2017'),
#                 sgp.projection.panel.years=c('2017'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
#                 sgp.projection.grade.sequences=list(c('EOCT')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.projection.sequence="MATHEMATICS",
                 sgp.norm.group.preference=2),
        ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2015', '2016', '2017'),
                 sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1),
        ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2015', '2016', '2017'),
                 sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1),
        ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=2),
 	ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                 sgp.panel.years=c('2015','2016', '2017'),
                 sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1),
        ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_II'),
                 sgp.panel.years=c('2015','2016', '2017'),
                 sgp.grade.sequences=list(c('7', '8', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1),
        ALGEBRA_II.2017 = list(
                 sgp.content.areas=c('GEOMETRY', 'ALGEBRA_I', 'ALGEBRA_II'),
                 sgp.panel.years=c('2015', '2016', '2017'),
                 sgp.grade.sequences=list(c('EOCT', 'EOCT', 'EOCT')),
                 sgp.projection.grade.sequences=list(c('NO_PROJECTIONS')),
                 sgp.exact.grade.progression=TRUE,
                 sgp.norm.group.preference=1)
)
