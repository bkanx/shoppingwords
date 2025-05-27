#' Normalize stopwords
#' This function loads stopwords from a CSV file within the package.
#' @param text Input word to normalize
#' @import stringi
#' @importFrom stringdist amatch
#' @import stopwords
#' @return Normalized version of the input word
#' @export
normalize_text <- function(text) {
  stopwords_url <- "https://raw.githubusercontent.com/bkanx/shoppingwords/main/data/stopwords_tr.csv"
  stopwords_tr <- read_csv(stopwords_url, col_names = TRUE)
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

    if (!is.na(iso_transfer_index)) {
      message(sprintf("\n%-30s", "Using shoppingwords_tr \u2192 No match found"))
      message(sprintf("\n%-30s", "Using stopwords_iso \u2192 Index Info:"))
      return(list(iso_index = iso_transfer_index,iso_transfer_word))  # Return matched word from stopwords_iso
    } else {
      return(NA) # No match found in either list
    }
  }
}

