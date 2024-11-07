library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(here)

# Load data
diabetes <- readRDS(here::here("data", "diabetes.rds"))

# Figure 1
hist1 <- ggplot(diabetes) +
	aes(x = Glucose) +
	geom_histogram(color = "black", fill = "lightblue", bins = 50) +
	labs(
		title = "Distribution of Glucose Levels in the Cohort",
		x = "Glucose (mg/dL)",
		y = "Frequency"
	)

# Save the plot
saveRDS(hist1, here::here("output", "figure_1.rds"))
