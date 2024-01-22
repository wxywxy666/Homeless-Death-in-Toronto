library(opendatatoronto)
library(janitor)
library(tidyverse)

homeless_deaths <-
  list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e") |>
  filter(name == 
           "Homeless deaths by cause.csv") |>
  get_resource()

write_csv(
  x = homeless_deaths,
  file = "inputs/data/unedited_homeless_deaths.csv"
)

cleaned_homeless_deaths <-
  clean_names(homeless_deaths) |>
  select(year_of_death, cause_of_death, count)

write_csv(
  x = cleaned_homeless_deaths,
  file = "inputs/data/cleaned_homeless_deaths.csv"
)


cleaned_homeless_deaths |>
  arrange(cause_of_death) |> 
  summarise(count = sum(count),
            .by = cause_of_death) |>
  kable(
    col.names = c("Cause_of_death", "Average daily number of occupied beds"),
    digits = 1
  )