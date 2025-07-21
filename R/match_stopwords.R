#' Remove Stopwords from User Reviews
#'
#' This function processes a dataframe containing user reviews and removes predefined stopwords.
#' It first searches the package's internal stopwords dataset (`stopwords_tr`), and if
#' no match is found, it falls back to the broader `stopwords_iso` list.
#'
#' The function converts text to a standardized format by removing accents and special characters,
#' transforming it into basic Latin characters, and making all letters lowercase. It then
#' tokenizes the text, filters out stopwords, and returns the cleaned version.
#' @param df Dataframe containing user reviews, with required columns `comment` (text) and `rating` (numerical score).
#' @return A modified dataframe with an additional `cleaned_text` column containing stopword-free text.
#' @import stringi
#' @importFrom stringdist amatch
#' @import stopwords
#' @importFrom tibble tibble
#' @export
#' @examples
#' reviews_sample <- tibble::tibble(
#'   comment = c("Bu ürün xs ancak fiyatı yüksek gibi",
#'               "Fiyat çok pahalı ama kaliteli iyi"),
#'   rating = c(4.5, 3.0)
#' )
#' match_stopwords(reviews_sample)
match_stopwords <- function(df) {
  # Load stopwords
 # get("stopwords_tr", envir = asNamespace("shoppingwords")) # Loads stopwords_tr.rda
  stopwords_tr <- shoppingwords::stopwords_tr$word # Extracts the column

  stopwords_iso <- stopwords::stopwords("tr", source = "stopwords-iso")

  # Ensure text column exists
  if (!"comment" %in% colnames(df) || !"rating" %in% colnames(df)) {
    stop("Dataframe must have 'comment' and 'rating' columns.")
  }

  # Function to clean individual text
  clean_text <- function(text) {
    if (is.na(text) || text == "") {
      return("")
    }
    text <- tolower(text)
    text_clean <- stringi::stri_trans_general(text, "Latin-ASCII")
    words <- unlist(strsplit(text_clean, "\\s+"))
    cleaned_words <- words[!words %in% stopwords_tr & !words %in% stopwords_iso]
    return(paste(cleaned_words, collapse = " "))
  }

  df$cleaned_text <- sapply(df$comment, clean_text) # Applies cleaning function to all rows

  return(df)
}

