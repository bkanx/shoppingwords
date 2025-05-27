#' Load dataset
#' This function loads corrected words from reviews and from a CSV (json) file within the package.
#' @param format The file format to load ("csv", or "json")
#' @return A data frame
#' @import readr
#' @importFrom tidyr pivot_longer
#' @import jsonlite
#' @export
load_corrected_words <- function(format = "csv") {
  if (format == "csv") {
    file_path <- system.file("extdata/corrected_words_v1_0", "corrected_words_10137.csv", package = "shoppingwords")
    if (file_path == "") stop("File does not exist in the package.")
    corrected_words_10137 <- readr::read_csv(file_path)

    # Pivot data to long format
    corrected_words_long <- tidyr::pivot_longer(corrected_words_10137,
                                                cols = everything(),
                                                names_to = "word",
                                                values_to = "corrected_word")

    return(corrected_words_long)

  } else if (format == "json") {
    return(jsonlite::fromJSON(system.file("extdata/corrected_words_v1_0", "corrected_words_10137.json", package = "shoppingwords")))
  } else {
    stop("Invalid format. Please choose 'csv', 'rds', or 'json'.")
  }
}

