#' Load dataset
#' @param format The file format to load ("csv" or "rds")
#' @return A data frame
#' @import readr
#' @import tidyr
#' @import jsonlite
#' @export
#' @examples
#'tidyr::pivot_longer(corrected_words_10137,
#'                     cols = everything(),  # Pivot all columns to long format
#'                                      names_to = "word", # Column name"
#'                                       values_to = "corrected_word") # Changed column name"
load_data <- function(format = "csv") {
  if (format == "csv") {
    return(readr::read_csv(system.file("data", "corrected_words_10137.csv", package = "shoppingwords")))
  } else if (format == "rds") {
    return(readRDS(system.file("data", "corrected_words_10137.rds", package = "shoppingwords")))
  } else if (format == "json") {
    return(fromJSON(system.file("data", "corrected_words_10137.json", package = "shoppingwords")))
  } else {
    stop("Invalid format. Please choose 'csv' or 'rds'.")
  }
}
