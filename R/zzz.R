.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Weigh ANCHOR!")
}

.onLoad <- function(libname, pkgname) {
  
  # make sure that the config directory exists
  config_dir <- rappdirs::user_config_dir(pkgname)
  if(!dir.exists(config_dir)) {
    print(sprintf("Creating config directory `%s`", config_dir))
    dir.create(config_dir)
  }
  
}
