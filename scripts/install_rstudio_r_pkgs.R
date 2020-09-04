dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
    "CXX14=g++", # or clang++ but you may need a version postfix
    file = M, sep = "\n", append = TRUE)

Sys.setenv(MAKEFLAGS = paste0("-j", parallel::detectCores()))
print(paste("MAKEFLAGS=", Sys.getenv("MAKEFLAGS")))

install.packages("rstan", type = "source", quiet = TRUE)


# -rstudio
list_of_packages <- c("addinslist", "blogdown", "bookdown", "usethis", "arules", "arulesViz", "brms", "caret", "parsnip", "ranger", "rpart", "rpart.plot",
                      "tidymodels", "ggstatsplot")

# dput(sort(unique(list_of_packages)))

list_of_packages <- unique(list_of_packages)

new_packages <- list_of_packages[! list_of_packages %in% installed.packages()[,"Package"] ]

# repo = 'https://cran.rstudio.com/',
if(length(new_packages)) install.packages(new_packages, quiet = TRUE)

# update old packages
## install.packages(attr(old.packages(), "dimnames")[[1]], repo = 'https://cran.rstudio.com/')

devtools::install_github("rmcelreath/rethinking",ref="Experimental")
