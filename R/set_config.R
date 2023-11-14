#' Sets the configuration file for each user to point to the ANCHOR config_json
#' 
#' You only need to run this once. This has some limited error checking but assumes
#' you are passing in a valid path. This is just the pointer to the main JSON file
#' in the ANCHOR directory. everything else you need will be in there.
#'  
#' @param config_path The full path to the getANCHORconfig.R file
#' @export
set_config <- function(config_json_loc = NULL) {
  
  # first check if its valid
  if(is.null(config_json_loc)) {
    stop("config_json_loc must not be null")
  } 
  if(!is.character(config_json_loc)) {
    stop("config_json_loc must be a character")
  }
  
  # get the config directory
  config_dir <- rappdirs::user_config_dir("getANCHOR")
  
  # set the user config file name
  config_file <- file.path(config_dir, "config_json_loc.RDS")
  
  # if config_json_loc already exists in the .config dir, do nothing
  # otherwise create it and fill it with config_file
  # and I guess you need to add to the global environment
  # eh, but thats a bad idea for naming purposes
  if(file.exists(config_file)) {
    print(sprintf("`%s` exists, file overwritten.", config_file))
  }
  saveRDS(config_json_loc, config_file)
  
}