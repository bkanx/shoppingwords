#' Normalize Stopwords in Text
#'
#' This function checks whether a given word is present in a predefined stopwords list.
#' It first searches the package's internal stopwords dataset (`stopwords_tr`), and if
#' no match is found, it falls back to the broader `stopwords_iso` list.
#'
#' The function converts text to a standard format by removing accents and special characters,
#' transforming it into basic Latin characters, and making all letters lowercase.
#' This ensures more accurate word comparisons.
#'
#' @param text Character string representing the word to normalize.
#' @return A list containing the matched word and its corresponding index, or `NULL` if no match is found.
#' @import stringi
#' @importFrom stringdist amatch
#' @import stopwords
#' @export
normalize_text <- function(text) {
  # Load stopwords directly from the package
  stopwords_tr <- load_stopwords("csv")
  text <- tolower(text)
  transfer <- stringi::stri_trans_general(text, "Latin-ASCII") # Converts "göre" → "gore"
  transfer_index <- stringdist::amatch(text, stopwords_tr$stopwords_all, method = "lv", maxDist = 1)
  transfer_word <- stopwords_tr$stopwords_all[transfer_index]
  if (!is.na(transfer_index)) {
    return(list(index = transfer_index, transfer_word)) # Return matched word from shoppingwords_tr
  } else {
    # Fallback to stopwords_iso if no match found
    stopwords_iso <- stopwords("tr", source = "stopwords-iso")
    iso_transfer_index <- stringdist::amatch(transfer, stopwords_iso, method = "lv", maxDist = 1)
    iso_transfer_word <- stopwords_iso[iso_transfer_index]

    if (!is.na(transfer_index) && !is.null(transfer_word)){
      message(sprintf("\n%-30s", "Using shoppingwords_tr \u2192 No match found"))
      message(sprintf("\n%-30s", "Using stopwords_iso \u2192 Index Info:"))
      return(list(iso_index = iso_transfer_index,iso_transfer_word))  # Return matched word from stopwords_iso
    } else {
      return(NA) # No match found in either list
    }
  }
}

