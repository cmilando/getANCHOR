#' This search text
#' 
#' Obviously a lot to update here, but not a bad start
#' 
#' @param readme_text a list output from get_all_readme_text, probably could be a class
#' @param search_string what you are looking for
#' @return the subset of list elements with that text string
#' @export
find_search_text <- function(readme_text, search_string) {
  lapply(readme_text, function(z) {
    z[which(grepl(x = tolower(z), pattern = tolower(search_string)))]
  })
}