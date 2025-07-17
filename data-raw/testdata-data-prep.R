# load packages ---------------------------------------------------------------

library(tidyverse)

# load raw data ---------------------------------------------------------------

testdata_raw <- read_csv(here::here("data-raw", "testdata.csv"))

# data prep -------------------------------------------------------------------

reviews_test <- testdata_raw |>
  mutate(id = 1:n())

# save data -------------------------------------------------------------------

usethis::use_data(reviews_test, overwrite = TRUE)
