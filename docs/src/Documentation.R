#######################################################################
###
### Script to generate Arizona SGP Report
###
#######################################################################

knitr::knit("Arizona_Report.Rmd")
rmarkdown::render("Arizona_Report.md", output_format="all")
file.rename("Arizona_Report.html", file.path("..", "index.html"))
file.rename("Arizona_Report.pdf", file.path("..", "Arizona_Report.pdf"))
unlink("Arizona_Report.md")
