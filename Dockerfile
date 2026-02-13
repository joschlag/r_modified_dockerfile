FROM rocker/r-ver:4.4.3

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev \
        libxml2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        libpng-dev \
        libjpeg-dev \
        libtiff5-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        libfreetype6-dev \
        libfontconfig1-dev \
        libudunits2-dev \
        libgdal-dev \
        libgeos-dev \
        libproj-dev && \
    apt-get clean

RUN mkdir /home/r-environment

# CRAN packages
RUN R -e "install.packages(c('dplyr', 'gapminder', 'remotes'))"

# GitHub
RUN R -e "remotes::install_github('ropensci/bold')"
RUN R -e "remotes::install_github('tobiasgf/lulu')"

# CRAN + Bioconductor
RUN R -e "install.packages('taxize')"
RUN R -e "install.packages('BiocManager')"

# Bioconductor
RUN R -e "BiocManager::install(c('XVector','Biostrings'))"
RUN R -e "BiocManager::install('phyloseq')"


CMD R.Version()
