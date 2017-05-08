### MATHEMATICS

MATHEMATICS_2016.config <- list(
    MATHEMATICS.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('3', '4', '5', '6'),
                                        c('4', '5', '6', '7'), c('5', '6', '7', '8')))
)


### ALGEBRA I

ALGEBRA_I_2016.config <- list(
	ALGEBRA_I.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('4', '5', '6', 'EOCT'), c('5', '6', '7', 'EOCT'),
                                        c('6', '7', '8', 'EOCT')),
		sgp.norm.group.preference=c(1,1)),
	ALGEBRA_I.2016 = list(
                sgp.content.areas=c('GEOMETRY', 'ALGEBRA_I'),
                sgp.panel.years=c('2015', '2016'),
                sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
		sgp.norm.group.preference=1)
)


### GEOMETRY

GEOMETRY_2016.config <- list(
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'GEOMETRY'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('5', '6', '7', 'EOCT'), c('6', '7', '8', 'EOCT')),
                sgp.projection.grade.sequences=c("NO_PROJECTIONS", "NO_PROJECTIONS"),
                sgp.norm.group.preference=c(1,1)),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('5', '6', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=1),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('6', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=2),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('6', '7', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=1),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=2),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('7', '8', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=1),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=2),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2015', '2016'),
                sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=3),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('8', '9', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=1),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('9', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=2),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('9', '10', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=1),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'ALGEBRA_I', 'GEOMETRY'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('10', 'EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=2),
	GEOMETRY.2016 = list(
                sgp.content.areas=c('ALGEBRA_II', 'GEOMETRY'),
                sgp.panel.years=c('2015', '2016'),
                sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1)
)


### ALGEBRA II

ALGEBRA_II_2016.config <- list(
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('6', '7', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('7', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=2),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('7', '8', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('8', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=2),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('8', '9', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('9', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=2),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('9', '10', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2014', '2015', '2016'),
                sgp.grade.sequences=list(c('10', 'EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=2),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('GEOMETRY', 'ALGEBRA_II'),
                sgp.panel.years=c('2015', '2016'),
                sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                sgp.exact.grade.progression=TRUE,
                sgp.norm.group.preference=3),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('ALGEBRA_I', 'ALGEBRA_II'),
                sgp.panel.years=c('2015', '2016'),
                sgp.grade.sequences=list(c('EOCT', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1),
	ALGEBRA_II.2016 = list(
                sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS', 'ALGEBRA_II'),
                sgp.panel.years=c('2013', '2014', '2015', '2016'),
                sgp.grade.sequences=list(c('6', '7', '8', 'EOCT')),
                sgp.projection.grade.sequences="NO_PROJECTIONS",
                sgp.norm.group.preference=1)
)
