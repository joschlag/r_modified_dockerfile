FROM rocker/r-ver:4.4.3

RUN mkdir /home/r-environment
RUN apt-get install zlib1g-dev
RUN R -e "install.packages(c('dplyr', 'gapminder', 'remotes'))"
RUN R -e "remotes::install_github('ropensci/bold')"
RUN R -e "install.packages('taxize')"
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('XVector')"
RUN R -e "library(BiocManager) & BiocManager::install('Biostrings')"

CMD R.Version()
