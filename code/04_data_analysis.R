library(tidyverse)
library(broom)
library(gt)
library(here)

diabetes <- readRDS(here::here("data", "diabetes.rds"))

# list to store each model's results
results <- list()

# Univariate logistic regression for each predictor

for (var in c("Pregnancies", "Glucose", "BloodPressure", "SkinThickness",
							"Insulin", "BMI", "DiabetesPedigreeFunction", "Age")) {
	#logistic regression model
	model <- glm(Outcome ~ get(var), data = diabetes, family = binomial)

	results[[var]] <- tidy(model, conf.int = TRUE) %>%
		mutate(variable = var) %>%
		filter(term != "(Intercept)")
}


all_results <- bind_rows(results) %>%
	mutate(
		odds_ratio = exp(estimate),
		conf.low = exp(conf.low),
		conf.high = exp(conf.high)
	)

# Summary table of findings
table2 <- all_results %>%
	select(variable, odds_ratio, conf.low, conf.high, p.value) %>%
	gt::gt() %>%
	cols_label(
		variable = "Variable",
		odds_ratio = "Odds Ratio",
		conf.low = "95% CI Lower",
		conf.high = "95% CI Upper",
		p.value = "P-value"
	)



# Save the table to an RDS file for further use
saveRDS(table2, here::here("output", "log_regr_summary.rds"))


