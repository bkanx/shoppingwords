#' A test dataset
#'
#' A test sample data used for testing analysis functions. It differs from reviews data.
#' The `text` column in this data frame is similar to the `comment` column in the `reviews`
#' data frame. Note that this data frame contains 170 `text`s that are in common, verbatim,
#' with comments in the `reviews` dataset. This is because some users made the same comments.
#' The `id` column shows that these are not the same observations, just similarly worded
#' comments from different reviews.
#'
#' @format A tbl_df with with 1,481 rows and 4 variables:
#' \describe{
#'   \item{rating}{Rating score, out of 5.}
#'   \item{text}{Comment text, in Turkish.}
#'   \item{emotion}{n for negative, p for positive.}
#'   \item{id}{Rating ID.}
#' }
"reviews_test"
