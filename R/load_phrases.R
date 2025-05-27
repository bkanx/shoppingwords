#' Load Predefined Phrases from Package Data#'
#' This function loads predefined phrases from a CSV file within the package.
#' It allows users to access common shopping related special phrases easily for
#' text processing or linguistic analysis.
#' @param format Character string specifying the format. Default is "csv".
#' @return A tibble containing the predefined phrases.
#' @export
load_phrases <- function(format = "csv") {
  if (format == "csv") {
    file_path <- system.file("data", "phrases.csv", package = "shoppingwords")
    if (file_path == "") stop("ERROR: File does not exist in the package.")
    return(readr::read_csv(file_path))
  } else {
    stop("ERROR: Invalid format. Please choose 'csv'.")
  }
}
