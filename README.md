# Parth Jariwala

# Contents of this repository

`data/` is the folder that has the original CSV and a cleaned and 
processed `diabetes.rds` file

`output/` is where all results, tables, and figures are saved

`01_load_data.R` loads and processes the original csv to create 
`data/diabetes.rds`

`02_desc_stats.R` makes the descriptive statistics for `table_one`
and is saved as `output/table_one.rds`

`03_figure1.R` creates `figure_1.rds` and is saved as `output/figure_1.rds`

`04_data_analysis.R` runs a logistic regression model and makes `table2` as is
saved as `output/log_regr_summary.rds`

`05_render_report.R` renders the final report, `finalreport.html`

`finalreport.Rmd` is the rmd file that structures the report, making the two
tables and figure

`Makefile` automates in generating the report and makes sure everything runs


# **How to generate the final report!**

Run `make finalreport.html` in the git terminal. It will run each script in the
make file and it will produce `finalreport.html`.


