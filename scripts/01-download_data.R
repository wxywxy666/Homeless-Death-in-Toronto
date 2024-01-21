library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Acquire ####
toronto_shelters <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/
  list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2") |>
  # Within that package, we are interested in the 2021 dataset
  filter(name == 
           "daily-shelter-overnight-service-occupancy-capacity-2021.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()


write_csv(
  x = toronto_shelters,
  file = "unedited_data.csv"
)
