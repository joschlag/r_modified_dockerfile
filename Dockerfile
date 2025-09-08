FROM rocker/r-ver:4.4.3

RUN apt-get update && \
    apt-get install -y zlib1g-dev && \
    apt-get clean

RUN mkdir /home/r-environment
RUN R -e "install.packages(c('dplyr', 'gapminder', 'remotes'))"
RUN R -e "remotes::install_github('ropensci/bold')"
RUN R -e "remotes::install_github('tobiasgf/lulu')"
RUN R -e "install.packages('taxize')"
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('XVector')"
RUN R -e "BiocManager::install('Biostrings')"

CMD R.Version()
