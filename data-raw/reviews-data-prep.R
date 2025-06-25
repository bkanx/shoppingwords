# load packages

library(tidyverse)

# load raw data

# reviews_raw <- read_rds(here::here("data-raw", "reviews.rds"))

# data prep

#reviews <- reviews_raw |>
# some code goes here

# save data

usethis::use_data(reviews, overwrite = TRUE)
