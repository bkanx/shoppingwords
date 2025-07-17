# load packages ---------------------------------------------------------------

library(tidyverse)

# load raw data ---------------------------------------------------------------

phrases_raw <- read_csv(here::here("data-raw", "phrases.csv"))

# data prep -------------------------------------------------------------------

phrases <- phrases_raw |>
  rename(word = phrases_all) |>
  as_tibble()

# save data --------------------------------------------------------------------

usethis::use_data(phrases, overwrite = TRUE)
