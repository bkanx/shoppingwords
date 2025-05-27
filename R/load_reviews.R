#' Load Review Data from RDS
#'
#' This function loads the main dataset of corrected words or product reviews from
#' an RDS file within the package.
#'
#' @return A tibble containing review data.
#' @importFrom readr read_rds
#' @export
load_reviews <- function() {
  file_path <- system.file("extdata/raw", "reviews_raw_v1.0.rds", package = "shoppingwords")

  if (file_path == "") {
    warning("Review data file is missing in the package. Returning an empty tibble.")
    return(tibble::tibble(review_id = integer(), text = character()))
  }
  return(readr::read_rds(file_path))
}
