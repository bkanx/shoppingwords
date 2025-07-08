# load packages

library(tidyverse)

# load raw data
stopwords_tr_raw <- read_csv(here::here("data-raw", "stopwords_tr.csv"))

# data prep
stopwords_tr <- stopwords_tr_raw |>
  rename(word = stopwords_all) |>
  as_tibble()

# save data
usethis::use_data(stopwords_tr, overwrite = TRUE)
