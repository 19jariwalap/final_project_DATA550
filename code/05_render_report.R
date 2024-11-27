library(here)
library(rmarkdown)

here::i_am(
	"code/05_render_report.R"
)

rmarkdown::render(
	here::here("finalreport.Rmd")
)
