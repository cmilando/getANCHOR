.onAttach <- function(libname, pkgname) {
  packageStartupMessage("getANCHOR updated")
}

.onLoad <- function(libname, pkgname) {
  # this is probably an awful idea
  devtools::install_github("https://github.com/cmilando/getANCHOR")
  library(getANCHOR)
}