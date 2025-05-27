#' Load predefined stopwords
#'
#' This function loads stopwords from a CSV file within the package.
#' @param format Character string specifying the format. Default is "csv".
#' @return A tibble with stopwords.
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

