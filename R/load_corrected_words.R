#' Load Corrected Words Dataset
#'
#' This function loads a predefined dataset of corrected words from within the package.
#' Users can choose between CSV or JSON format. The function restructures CSV data into
#' a long format for easier text analysis.
#' @param format The format of the dataset to load. Options: `"csv"` or `"json"`.
#'        Default is `"csv"`.
#' @return A data frame containing corrected word mappings.
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
                                                cols = tidyselect::everything(),
                                                names_to = "word",
                                                values_to = "corrected_word")
    return(corrected_words_long)
  } else if (format == "json") {
    return(jsonlite::fromJSON(system.file("extdata/corrected_words_v1_0", "corrected_words_10137.json", package = "shoppingwords")))
  } else {
    stop("Invalid format. Please choose 'csv', 'rds', or 'json'.")
  }
}

