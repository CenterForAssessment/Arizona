#######################################################################
###
### Script to generate Arizona SGP Report
###
#######################################################################

knitr::knit("Arizona_SGP_Report.Rmd")
rmarkdown::render("Arizona_SGP_Report.md", output_format="all")
file.rename("Arizona_SGP_Report.html", file.path("..", "Arizona_SGP_Report.html"))
file.rename("Arizona_SGP_Report.pdf", file.path("..", "Arizona_SGP_Report.pdf"))
unlink("Arizona_SGP_Report.md")
