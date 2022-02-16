# Author: Etienne CAMENEN
# Date: 2021
# Contact: etienne.camenen@gmail.com

FROM rocker/rstudio

MAINTAINER Etienne CAMENEN (etienne.camenen@gmail.com)

ENV PKGS libxml2-dev libcurl4-openssl-dev libssl-dev liblapack-dev git cmake qpdf
ENV RPKGS car buildmer BiocManager covr devtools emmeans ggplot2 golem lme4 lmerTest knitr lintr openxlsx plotly readxl reshape2 rmarkdown testthat styler wesanderson
ENV _R_CHECK_FORCE_SUGGESTS_ FALSE
RUN apt-get update -qq && \
    apt-get install -y ${PKGS}
RUN Rscript -e 'install.packages(commandArgs(TRUE))' ${RPKGS}
RUN Rscript -e 'BiocManager::install("BiocCheck")'
RUN apt-get install -y --no-install-recommends libxt6
RUN Rscript -e 'install.packages("markdown")'
RUN Rscript -e 'devtools::install_github("dustinfife/flexplot")'
COPY . /home/rstudio