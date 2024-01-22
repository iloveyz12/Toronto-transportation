#### Preamble ####
# Purpose: Download the dataset of Toronto stolen vehicles
# Author: Zheng(Zeb) Yang
# Email: zhengzeb.yang@mail.utoronto.ca
# Date: 22 January 2024
# Prerequisites: -

install.packages("opendatatoronto")
install.packages("tidyverse")
install.packages("knitr")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Acquire ####
toronto_stolen_vehicle <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/theft-from-motor-vehicle/
  list_package_resources("1fc65d1e-7dae-4766-98dd-3b172e40a089") |>
  filter(name == 
           "theft-from-motor-vehicle - 4326.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

write_csv(
  x = toronto_stolen_vehicle,
  file = "inputs/data/unedited_data.csv"
)

head(toronto_stolen_vehicle)

toronto_stolen_vehicle_clean <-
  clean_names(toronto_stolen_vehicle) |>
  mutate(report_date = ymd(paste(report_year, report_month, report_day))) |> 
  select(report_date, location_type ,x_id)

head(toronto_stolen_vehicle_clean)

write_csv(
  x = toronto_stolen_vehicle_clean,
  file = "inputs/data/cleaned_data.csv"
)
