# install package that meant to be used
# the basic packages
# For production

if (!require(remotes)) {
  install.packages('remotes', repo = 'https://cran.rstudio.com/')
} else if (packageVersion("remotes") < "2.0.4") {
  install.packages('remotes', repo = 'https://cran.rstudio.com/')
}

if (!require(devtools)) install.packages("devtools", repo = 'https://cran.rstudio.com/')

# - ariflow
# - plumber
# - shiny
list_of_packages <- c("arrow", "config", "data.table", "DT", "fst", "future", "ggrepel", 
                      "ggthemes", "glue", "htmltools", "htmlwidgets", "httpuv", "jose", 
                      "JuliaCall", "knitr", "loggit", "mailR", "odbc", "openxlsx", 
                      "optparse", "patchwork", "plotly", "pool", "readxl", "rebus", 
                      "redux", "reticulate", "rJava", "rlist", "RMariaDB", "rmarkdown", "RPostgreSQL", 
                      "sjmisc", "snakecase", "tidyverse", "wordcloud2", "writexl", "blastula", "keyring",
                      "XML")

# dput(sort(unique(list_of_packages)))

list_of_packages <- unique(list_of_packages)

new_packages <- list_of_packages[! list_of_packages %in% installed.packages()[,"Package"] ]

if(length(new_packages)) install.packages(new_packages, repo = 'https://cran.rstudio.com/')

# update old packages
## install.packages(attr(old.packages(), "dimnames")[[1]], repo = 'https://cran.rstudio.com/')

remotes::install_github("rstudio/plumber")
remotes::install_github("shizidushu/hfun")
