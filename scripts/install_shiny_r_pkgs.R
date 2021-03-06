# install package that might be used in shiny server
# For production

if (!require(remotes)) {
  install.packages('remotes', repo = 'https://cran.rstudio.com/')
} else if (packageVersion("remotes") < "2.0.4") {
  install.packages('remotes', repo = 'https://cran.rstudio.com/')
}

if (!require(devtools)) install.packages("devtools", repo = 'https://cran.rstudio.com/')

# -shiny
list_of_packages <- c("promises", "shinydashboard", "shinyWidgets",  "shinyjs", "shinyTime", "listviewer", "gt", "reactable", "pdftools", "shinydisconnect", "waiter", "shinyFeedback", "V8")

# dput(sort(unique(list_of_packages)))

list_of_packages <- unique(list_of_packages)

new_packages <- list_of_packages[! list_of_packages %in% installed.packages()[,"Package"] ]

install.packages("shiny", repo = 'https://cran.rstudio.com/')
if(length(new_packages)) install.packages(new_packages, repo = 'https://cran.rstudio.com/')

# update old packages
## install.packages(attr(old.packages(), "dimnames")[[1]], repo = 'https://cran.rstudio.com/')

remotes::install_github('bbc/bbplot')
devtools::install_github("shizidushu/shinycomp")