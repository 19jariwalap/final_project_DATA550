# Rule to create thee final report
finalreport.html: output/table_one.rds \
	output/figure_1.rds \
	output/log_regr_summary.rds \
	finalreport.rmd code/05_render_report.R
	Rscript code/05_render_report.R


# Rule to load in the data
data/diabetes.rds:
	Rscript 01_load_data.R

# Rule to create table one output from second script
output/table_one.rds: data/diabetes.rds
	Rscript 02_desc_stats.R

# Rule to create figure one output from third script
output/figure_1.rds: data/diabetes.rds
	Rscript 03_figure1.R

# Rule to create table 2 output from fourth script
output/log_regr_summary.rds: data/diabetes.rds
	Rscript 04_data_analysis.R

clean:
	rm -f data/diabetes.rds output/*.rds report.html
