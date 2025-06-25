# load packages

library(tidyverse)

# load raw data

# stopwords_tr_raw <- read_csc(here::here("data-raw", "stopwordsXYZ.csv"))

# data prep

#stopwords_tr <- stopwords_tr_raw |>
# some code goes here |>
# rename(word = stopwords_all) |>
# as_tibble()

# save data

usethis::use_data(stopwords_tr, overwrite = TRUE)
