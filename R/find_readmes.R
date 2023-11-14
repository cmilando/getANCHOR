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
  stopifnot(!is.null(config_json[['ANCHOR_wd']]))
  WD <- config_json[['ANCHOR_wd']]
  
  # now, get all files that start with -README.txt in them
  all_readmes <- list.files(WD, "^-README", recursive = T,
             full.names=TRUE, include.dirs=TRUE)
  # remove  the TEMPLATE file
  all_readmes <- all_readmes[-which(all_readmes == 
                                      file.path(WD, "-README_TEMPLATE.txt"))]

  return(all_readmes)
  
}