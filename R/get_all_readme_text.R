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