#' Load a Dataset from the Package
#'
#' This function loads datasets from the `datasets/` folder based on user input.
#' Supports `"csv"`, `"json"`, and `"rds"` formats.
#'
#' @param dataset_name The name of the dataset file (e.g., `"reviews"`, `"stopwords"`).
#' @param format The format of the dataset to load (`"csv"`, `"json"`, or `"rds"`).
#'        Default is `"csv"`.
#' @return A data frame or list containing the dataset.
#' @import readr jsonlite tidyr
#' @export
load_dataset <- function(dataset_name, format = "csv") {
  filename <- paste0(dataset_name, ".", format)
  file_path <- file.path("datasets", filename)

  if (!file.exists(file_path)) stop("File does not exist in the package.")

  if (format == "csv") {
    return(readr::read_csv(file_path))
  } else if (format == "json") {
    return(jsonlite::fromJSON(file_path))
  } else if (format == "rds") {
    return(readRDS(file_path))
  } else {
    stop("Invalid format. Please choose 'csv', 'rds', or 'json'.")
  }
}

