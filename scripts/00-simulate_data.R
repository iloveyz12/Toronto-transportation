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
    date = c(rep(x = as.Date("2014-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2015-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2016-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2017-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2018-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2019-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2020-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2021-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2022-01-01") + c(0:364), times = 7),
             rep(x = as.Date("2023-01-01") + c(0:364), times = 7)
    ),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    location = c(
      rep(x = "Apartment", times = 3650),
      rep(x = "Commercial", times = 3650),
      rep(x = "Educational", times = 3650),
      rep(x = "House", times = 3650),
      rep(x = "Other", times = 3650),
      rep(x = "Outside", times = 3650),
      rep(x = "Transit", times = 3650)
    ),
    number_of_stolen =
      rpois(
        n = 365 * 7 * 10,
        lambda = 10
      ) # Draw 2,555 times from the Poisson distribution
  )

head(simulated_stolen_vehicle_data)


### Tests ###
simulated_stolen_vehicle_data$location |>
  unique() == c("Apartment", "Commercial", "Educational", "House","Other" , "Outside","Transit" )

simulated_stolen_vehicle_data$location |>
  unique() |>
  length() == 7

as.integer(format(simulated_stolen_vehicle_data$date, "%Y")) |> min() == 2014
as.integer(format(simulated_stolen_vehicle_data$date, "%Y")) |> max() == 2023
simulated_stolen_vehicle_data$number_of_stolen |> min() >= 0
simulated_stolen_vehicle_data$number_of_stolen |> max() <= 1000
simulated_stolen_vehicle_data$number_of_stolen |> class() == "integer"
