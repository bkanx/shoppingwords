# load packages
library(tidyverse)

# load raw data
testdata_raw <- read_csv(here::here("data-raw", "testdata.csv"))

# test real-world familiarity
# split first (preserves randomness)
split <- initial_split(testdata, prop = 0.8, strata = emotion)
train_data <- training(split)
validation_data <- testing(split)

# remove overlaps from validation AFTER splitting
overlaps <- intersect(validation_data$text, reviews$comment)
diagnostic_set <- validation_data |>
  filter(text %in% overlaps) # contains comments found in both testdata and reviews (the 170 common ones)
validation_data_clean <- validation_data |>
  filter(!text %in% overlaps) #validation_data minus 170 overlaps

# save data
usethis::use_data(testdata, overwrite = TRUE)
