FROM rocker/r-ver:4.4.3

RUN mkdir /home/r-environment

RUN R -e "install.packages(c('dplyr', 'gapminder', 'bold'))"

CMD R.Version()
