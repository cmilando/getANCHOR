#' Sets configuration file location
#' 
#' You only need to run this once. This has some limited error checking but assumes
#' you are passing in a valid path
#'  
#' @param config_path The full path to the getANCHORconfig.R file
#' @export
set_config <- function(config_value = NULL) {
  
  # first check if its valid
  if(is.null(config_value)) {
    stop("config_value must not be null")
  } 
  if(!is.character(config_value)) {
    stop("config_value must be a character")
  }
  
  # get the config directory
  config_dir <- rappdirs::user_config_dir("getANCHOR")
  
  # set the config file name
  config_file <- file.path(config_dir, "config.RDS")
  
  # if config.R file already exists in the .config dir, do nothing
  # otherwise create it and fill it with config_file
  # and I guess you need to add to the global environment
  # eh, but thats a bad idea for naming purposes
  if(file.exists(config_file)) {
    print(sprintf("`%s` exists, file overwritten.", config_file))
    x <- readRDS(config_file)
    x$WD <- config_value
    saveRDS(x, config_file)
  } else{
    saveRDS(list(WD = config_value), config_file)
  }

  
}