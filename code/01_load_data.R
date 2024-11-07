library(RCurl)
library(tidyverse)
library(here)

# Reading CSV from my online repo
diabetes_url <- getURL("https://raw.githubusercontent.com/19jariwalap/final_project_DATA550/refs/heads/main/data/diabetes.csv")
diabetes <- read.csv(text = diabetes_url)

diabetes <- diabetes %>%
	mutate(Outcome = factor(Outcome, levels = c(0, 1), labels = c("No Diabetes", "Diabetes")))

# Save data to an RDS file
saveRDS(diabetes, here::here("data", "diabetes.rds"))
