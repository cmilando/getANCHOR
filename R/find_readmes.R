#' Find all READMES
#' 
#' This is the first step, to find all the READMEs
#' @param all_readmes a vector of all readme file locations
#' @export
find_READMES <- function() {
  
  # first, get the working dir
  config_dir <- rappdirs::user_config_dir("getANCHOR")
  config_file <- file.path(config_dir, "config_json_loc.RDS")
  config_json_loc <- readRDS(config_file)
  config_json <- jsonlite::read_json(config_json_loc)
  
  # check to make sure that config_json has what you need in it
  stopifnot(!is.null(config_json[['WD']]))
  WD <- config_json[['WD']]
  
  # now, get all files that have -README.txt in them
  all_readmes <- list.files(WD, "^_README", recursive=TRUE, 
                       full.names=TRUE, include.dirs=TRUE)
  return(all_readmes)
  
}