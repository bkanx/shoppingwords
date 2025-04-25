#' Load stopwords dataset
#' @param format The file format to load ("csv")
#' @return A data frame (tibble)
#' @import readr
#' @export
load_stopwords <- function(format = "csv") {
    return(readr::read_csv(system.file("data", "stopwords_tr.csv", package = "shoppingwords")))
  }
