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
    date = rep(x = as.Date("2022-01-01") + c(0:364), times = 5),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    location = c(
      rep(x = "Parking Lots (Apt., Commercial Or Non-Commercial)", times = 365),
      rep(x = "Streets, Roads, Highways (Bicycle Path, Private Road)", times = 365),
      rep(x = "Single Home, House (Attach Garage, Cottage, Mobile)", times = 365),
      rep(x = "Apartment (Rooming House, Condo)", times = 365),
      rep(x = "Commercial Dwelling Unit (Hotel, Motel, B & B, Short Term Rental)", times = 365)
    ),
    number_stolen =
      rpois(
        n = 365 * 5,
        lambda = 30
      ) # Draw 1,095 times from the Poisson distribution
  )

head(simulated_stolen_vehicle_data)

