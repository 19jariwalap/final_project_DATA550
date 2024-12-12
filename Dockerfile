FROM rocker/rstudio:4.4.1 as base

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        g++ \
        libxml2-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        r-base-dev

RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project


COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

##### DO NOT EDIT STAGE 1 BUILD LINES ABOVE #####

FROM rocker/rstudio:4.4.1

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

#setting workdir again
WORKDIR /home/rstudio/project

#copying existing makefile to image and finalreport.rmd
COPY Makefile ./
COPY finalreport.Rmd ./

#making code, output, data, and final_report folders (code and output are empty)
RUN mkdir -p code \
    && mkdir -p output \
    && mkdir -p data \
    && mkdir -p final_report

#copying data from local to image
COPY data/diabetes.csv ./data/diabetes.csv

COPY code/ ./code/

CMD make && mv finalreport.html final_report
