#' Load predefined phrases
#'
#' This function loads predefined phrases from a CSV file within the package.
#' @param format Character string specifying the format. Default is "csv".
#' @return A tibble with predefined phrases.
#' @export
load_phrases <- function(format = "csv") {
  if (format == "csv") {
    file_path <- system.file("data", "phrases.csv", package = "shoppingwords")
    if (file_path == "") stop("File does not exist in the package.")
    return(readr::read_csv(file_path))
  } else {
    stop("Invalid format. Please choose 'csv'.")
  }
}
