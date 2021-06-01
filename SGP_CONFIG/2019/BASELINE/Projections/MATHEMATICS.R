################################################################################
###                                                                          ###
###     Configurations for STRAIGHT (skip-year) Math projections in 2019     ###
###                                                                          ###
################################################################################

MATHEMATICS_2019.config <- list(
    MATHEMATICS.2019 = list(
        sgp.content.areas=rep("MATHEMATICS", 2),
        sgp.baseline.content.areas=rep("MATHEMATICS", 2),
        sgp.panel.years=c("2017", "2019"),
        sgp.baseline.panel.years=c("2017", "2019"),
        sgp.grade.sequences=list(c("3", "5")),
        sgp.baseline.grade.sequences=list(c("3", "5")),
        sgp.projection.baseline.content.areas="MATHEMATICS",
        sgp.projection.baseline.panel.years="2019",
        sgp.projection.baseline.grade.sequences=list(c("3")),
        sgp.projection.sequence="MATHEMATICS_GRADE_3"),
    MATHEMATICS.2019 = list(
        sgp.content.areas=rep("MATHEMATICS", 3),
        sgp.baseline.content.areas=rep("MATHEMATICS", 3),
        sgp.baseline.panel.years=c("2016", "2017", "2019"),
        sgp.panel.years=c("2016", "2017", "2019"),
        sgp.grade.sequences=list(c("3", "4", "6")),
        sgp.baseline.grade.sequences=list(c("3", "4", "6")),
        sgp.projection.baseline.content.areas=rep("MATHEMATICS", 2),
        sgp.projection.baseline.panel.years=c("2018", "2019"),
        sgp.projection.baseline.grade.sequences=list(c("3", "4")),
        sgp.projection.sequence="MATHEMATICS_GRADE_4"),
    MATHEMATICS.2019 = list(
        sgp.content.areas=rep("MATHEMATICS", 3),
        sgp.baseline.content.areas=rep("MATHEMATICS", 3),
        sgp.baseline.panel.years=c("2016", "2017", "2019"),
        sgp.panel.years=c("2016", "2017", "2019"),
        sgp.grade.sequences=list(c("4", "5", "7")),
        sgp.baseline.grade.sequences=list(c("4", "5", "7")),
        sgp.projection.baseline.content.areas=rep("MATHEMATICS", 2),
        sgp.projection.baseline.panel.years=c("2018", "2019"),
        sgp.projection.baseline.grade.sequences=list(c("4", "5")),
        sgp.projection.sequence="MATHEMATICS_GRADE_5"),
    MATHEMATICS.2019 = list(
        sgp.content.areas=rep("MATHEMATICS", 3),
        sgp.baseline.content.areas=rep("MATHEMATICS", 3),
        sgp.baseline.panel.years=c("2016", "2017", "2019"),
        sgp.panel.years=c("2016", "2017", "2019"),
        sgp.grade.sequences=list(c("5", "6", "8")),
        sgp.baseline.grade.sequences=list(c("5", "6", "8")),
        sgp.projection.baseline.content.areas=rep("MATHEMATICS", 2),
        sgp.projection.baseline.panel.years=c("2018", "2019"),
        sgp.projection.baseline.grade.sequences=list(c("5", "6")),
        sgp.projection.sequence="MATHEMATICS_GRADE_6")
)
