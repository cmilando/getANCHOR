#' Get all text in the readmes
#' 
#' Get all text. Exported for now, maybe not forever.
#' 
#' @param all_readmes the file names for all readmes
#' @returns a loosely organized list of all text in each file, that you can search
#' @export
get_all_readme_text <- function(all_readmes) {
  
  out_l <- vector("list", length(all_readmes))
  names(out_l) <- all_readmes
  
  for(i in 1:length(all_readmes)) {
    
    out_l[[i]] <- readLines(all_readmes[i])
    
  }
  
  return(out_l)
}

#' This search text
#' 
#' Obviously a lot to update here, but not a bad start
#' 
#' @param readme_text a list output from get_all_readme_text, probably could be a class
#' @param search_string what you are looking for
#' @return the subset of list elements with that text string
find_search_text <- function(readme_text, search_string) {
  lapply(readme_text, function(y) {
    y[which(grepl(x = tolower(y), pattern = tolower(search_string)))]
  })
}