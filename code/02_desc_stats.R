library(tidyverse)
library(gtsummary)
library(here)

# Load diabetes data
diabetes <- readRDS(here::here("data", "diabetes.rds"))

# Table 1
table_one <- diabetes %>%
	tbl_summary(
		by = Outcome,
		statistic = all_continuous() ~ "{mean} ({sd})",
		label = list(
			Pregnancies ~ "Number of Pregnancies",
			Glucose ~ "Glucose Level",
			BloodPressure ~ "Blood Pressure (mm Hg)",
			SkinThickness ~ "Skin Thickness (mm)",
			Insulin ~ "Insulin Level (μIU/mL)",
			BMI ~ "BMI",
			DiabetesPedigreeFunction ~ "Diabetes Pedigree Function",
			Age ~ "Age (Years)"
		),
		missing_text = "Missing"
	) %>%
	add_overall(last = TRUE) %>%
	modify_header(label ~ "**Variable**") %>%
	bold_labels()

# Save Table 1
saveRDS(table_one, here::here("output", "table_one.rds"))




