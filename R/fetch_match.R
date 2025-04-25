#' Load dataset
#' @param format The file format to load ("csv")
#' @import stringi
#' @import stringdist
#' @import stopwords
#' @return A data frame
#' @examples
#' user_input <- "Göre"
#' match <- amatch("göre", stopwords_all, method = "lv", maxDist = 1)
#' normalized_input <- normalize_text(user_input)
normalize_text <- function(text) {
  text <- tolower(text)
  transfer <- stri_trans_general(text, "Latin-ASCII") # Converts "göre" → "gore"
  transfer_index <- amatch(text, stopwords_tr, method = "lv", maxDist = 1)
  if (!is.na(transfer_index)) {
    return(transfer_index) # Return matched word from shoppingwords_tr
  } else {
    # Fallback to stopwords_iso ff no match found
    stopwords_iso <- stopwords("tr", source = "stopwords-iso")
    iso_transfer_index <- amatch(transfer, stopwords_iso, method = "lv", maxDist = 1)

    if (!is.na(iso_transfer_index)) {
      message(sprintf("\n%-30s", "Using shoppingwords_tr → No match found"))
      message(sprintf("\n%-30s", "Using stopwords_iso → Index Info:"))
      return(iso_transfer_index) # Return matched word from stopwords_iso
    } else {
      return(NA) # No match found in either list
    }
  }
}

