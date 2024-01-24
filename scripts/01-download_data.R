library(opendatatoronto)
library(janitor)
library(tidyverse)
library(knitr)
library(kableExtra)

# Download dataset from opendatatoronto
homeless_deaths <-
  list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e") |>
  filter(name == 
           "Homeless deaths by cause.csv") |>
  get_resource()

# Save into folder
write_csv(
  x = homeless_deaths,
  file = "inputs/data/unedited_homeless_deaths.csv"
)

# Clean data name
cleaned_homeless_deaths <-
  clean_names(homeless_deaths) |>
  select(year_of_death, cause_of_death, count)

# Save into folder
write_csv(
  x = cleaned_homeless_deaths,
  file = "inputs/data/cleaned_homeless_deaths.csv"
)

# Force on cause of death
cleaned_homeless_deaths <-
  read_csv("inputs/data/cleaned_homeless_deaths.csv")

cleaned_homeless_deaths <-
  cleaned_homeless_deaths |>
    arrange(cause_of_death) |> 
    summarise(count = sum(count),
              .by = cause_of_death)
# Use kable to present the data
kable(
  cleaned_homeless_deaths,
  caption = "Count of death arranged by cause",
  col.names = c("Cause_of_death", "Count of Death"),
  format = "markdown",
  align = c("l", "r"))