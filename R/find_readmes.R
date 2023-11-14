#' Find all READMES
#' 
#' This is the first step, to find all the READMEs
#' @param all_readmes a vector of all readme file locations
#' @export
find_READMES <- function() {
  
  # first, get the working dir
  config_dir <- rappdirs::user_config_dir("getANCHOR")
  config_file <- file.path(config_dir, "config.RDS")
  WD <- readRDS(config_file)$WD
  
  # now, get all files that have -README.txt in them
  all_readmes <- list.files(WD, "^_README", recursive=TRUE, 
                       full.names=TRUE, include.dirs=TRUE)
  return(all_readmes)
  
}