# load packages

library(tidyverse)

# load raw data
reviews <- read_csv(here::here("data-raw", "review.csv"))

# to look for comments that contain "5 yıldız verdim" associated with 5 star score:
filtered_reviews <- reviews |>
  filter(str_detect(comment, fixed("5 yıldız verdim")) & rating == 5)

# save data
usethis::use_data(reviews, overwrite = TRUE)
