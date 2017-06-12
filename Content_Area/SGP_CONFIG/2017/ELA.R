### ELA_2017

ELA_2017.config <- list(
         ELA.2017 = list(
                 sgp.content.areas=c('ELA', 'ELA', 'ELA'),
#                 sgp.projection.content.areas=c('ELA', 'ELA'),
                 sgp.panel.years=c('2015', '2016', '2017'),
#                 sgp.projection.panel.years=c('2016', '2017'),
                 sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('4', '5', '6'),
                                             c('5', '6', '7'), c('6', '7', '8'), c('7', '8', '9'),
                                             c('8', '9', '10'), c('9', '10', '11')),
#                 sgp.projection.grade.sequences=list('3', c('3', '4'), c('4', '5'), c('5', '6'), c('6', '7'), c('7', '8'), c('8', '9'), c('9', '10')),
                 sgp.projection.sequence="ELA")
)
