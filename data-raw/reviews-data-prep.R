# load packages ---------------------------------------------------------------

library(tidyverse)

# load raw data ---------------------------------------------------------------

reviews <- read_csv(here::here("data-raw", "review.csv"))

# save data -------------------------------------------------------------------

usethis::use_data(reviews, overwrite = TRUE)
