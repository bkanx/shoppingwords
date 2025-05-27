#' Load predefined stopwords list for Turkish shopping-related text analysis
#'
#' This function retrieves a predefined list of 92 stopwords from a CSV file
#' stored within the package. These stopwords are commonly used in Turkish
#' shopping-related text data
#' @param format Character string specifying the format. Default is "csv".
#' @return A tibble containing predefined Turkish stopwords shopping based-special.
#' @export
load_stopwords <- function(format = "csv") {
  if (format == "csv") {
    file_path <- system.file("extdata/stopwords/v1.0", "stopwords_tr.csv", package = "shoppingwords")
    if (file_path == "") stop("File does not exist in the package.")
    return(readr::read_csv(file_path))
  } else {
    stop("Invalid format. Please choose 'csv'.")
  }
}

