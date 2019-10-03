## code to prepare `my_dataset` dataset goes here
library(tidyverse)

cat("Script for food data\n")
cat("\n")
cat(Sys.Date())

food <- read_tsv("https://www.data.gouv.fr/fr/datasets/r/7d24aa59-b57a-4c94-9851-8e7019abbe8e")

food <- food %>%
  treatment_db()

usethis::use_data(food, overwrite = TRUE)

