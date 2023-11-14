.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to my package")
}

.onLoad <- function(libname, pkgname) {
  print("loaded")
}