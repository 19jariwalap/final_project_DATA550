# Rule to create thee final report
finalreport.html: output/table_one.rds \
	output/figure_1.rds \
	output/log_regr_summary.rds \
	finalreport.Rmd code/05_render_report.R
	Rscript code/05_render_report.R


# Rule to load in the data
data/diabetes.rds:
	Rscript code/01_load_data.R

# Rule to create table one output from second script
output/table_one.rds: data/diabetes.rds
	Rscript code/02_desc_stats.R

# Rule to create figure one output from third script
output/figure_1.rds: data/diabetes.rds
	Rscript code/03_figure1.R

# Rule to create table 2 output from fourth script
output/log_regr_summary.rds: data/diabetes.rds
	Rscript code/04_data_analysis.R

.PHONY: clean
clean:
	rm -f data/diabetes.rds output/*.rds finalreport.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# rule to build the report automatically in our container
# $$(<command>) does command substitution in make

final_report/finalreport.html:
	mkdir -p final_report
	# Windows
	docker run -v "/$$(pwd)/final_report":/home/rstudio/project/final_report 19jariwalap/final_7_new
