library(tidyverse)
library(here)

# Reading CSV
diabetes_raw <- read.csv(here::here("data", "diabetes.csv"))

diabetes <- diabetes_raw %>%
	mutate(Outcome = factor(Outcome, levels = c(0, 1),
																 labels = c("No Diabetes", "Diabetes")))

# Save data to an RDS file
saveRDS(diabetes, here::here("data", "diabetes.rds"))
