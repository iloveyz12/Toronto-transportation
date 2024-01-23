#### Preamble ####
# Purpose: Simulate data on 2022 stolen vehicles and make table
# Author: Zheng(Zeb) Yang
# Email: zhengzeb.yang@mail.utoronto.ca
# Date: 22 January 2024
# Prerequisites: -

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")
install.packages("tidyverse")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Simulate ####
set.seed(812)

simulated_stolen_vehicle_data <-
  tibble(
    date = rep(x = as.Date("2014-01-01") + c(0:364), times = 7),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    location = c(
      rep(x = "Apartment", times = 365),
      rep(x = "Commercial", times = 365),
      rep(x = "Educational", times = 365),
      rep(x = "House", times = 365),
      rep(x = "Other", times = 365),
      rep(x = "Outside", times = 365),
      rep(x = "Transit", times = 365)
    ),
    number_of_stolen =
      rpois(
        n = 365 * 7,
        lambda = 10
      ) # Draw 2,555 times from the Poisson distribution
  )

head(simulated_stolen_vehicle_data)

