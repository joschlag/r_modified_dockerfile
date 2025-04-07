FROM rocker/r-ver:4.4.3

RUN mkdir /home/r-environment

RUN R -e "install.packages(c('dplyr', 'gapminder', 'remotes', 'taxize'))"
RUN R -e "remotes::install_github('ropensci/bold')"

CMD R.Version()
