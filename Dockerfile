# Author: Etienne CAMENEN
# Date: 2021
# Contact: etienne.camenen@gmail.com

FROM rocker/rstudio

MAINTAINER Etienne CAMENEN (etienne.camenen@gmail.com)

ENV PKGS libxml2-dev libcurl4-openssl-dev libssl-dev liblapack-dev git cmake qpdf
ENV RPKGS BiocManager bookdown buildmer car covr devtools emmeans ggplot2 ggpubr ggResidpanel golem kableExtra knitr lintr lme4 lmerTest openxlsx pander plotly readxl reshape2 rmarkdown rstatix sjPlot styler testthat texreg tidyverse wesanderson
ENV _R_CHECK_FORCE_SUGGESTS_ FALSE
RUN apt-get update -qq && \
    apt-get install -y ${PKGS}
RUN Rscript -e 'install.packages(commandArgs(TRUE))' ${RPKGS}
RUN Rscript -e 'BiocManager::install("BiocCheck")'
RUN apt-get install -y --no-install-recommends libxt6
RUN Rscript -e 'install.packages("markdown")'
RUN Rscript -e 'devtools::install_github("dustinfife/flexplot")'
COPY . /home/rstudio