# Author: Etienne CAMENEN
# Date: 2021
# Contact: etienne.camenen@gmail.com

FROM rocker/rstudio

MAINTAINER Etienne CAMENEN (etienne.camenen@gmail.com)

ENV PKGS cmake git libcurl4-openssl-dev libglpk-dev liblapack-dev libssl-dev libxml2-dev libxt6 qpdf
ENV _R_CHECK_FORCE_SUGGESTS_ FALSE
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ${PKGS}
ENV RPKGS BiocManager bookdown buildmer car corrplot covr devtools emmeans factoextra FactoMineR ggplot2 ggpubr ggResidpanel golem kableExtra knitr lintr lme4 lmerTest markdown MASS modelr openxlsx pander plotly readxl reshape2 rmarkdown rstatix sjPlot styler testthat texreg tidyverse wesanderson
RUN Rscript -e 'install.packages(commandArgs(TRUE))' ${RPKGS}
RUN Rscript -e 'BiocManager::install("BiocCheck")'
RUN Rscript -e 'BiocManager::install("mixOmics")'
RUN Rscript -e 'devtools::install_github("dustinfife/flexplot")'
RUN Rscript -e 'devtools::install_github("rgcca-factory/RGCCA")'
COPY . /home/rstudio