library(janitor)
library(tidyverse)

# Set a seed for reproducibility
set.seed(888)

# Number of observations
num_observations <- 500

# Simulate the "year" variable
years <- sample(2017:2023, num_observations, replace = TRUE)

# Simulate the "cause of death" variable
causes <- sample(paste0("cause", 1:5), num_observations, replace = TRUE)

# Simulate the "count" variable
counts <- sample(1:10, num_observations, replace = TRUE)

# Create a data frame
simulated_data <- data.frame(
  year = years,
  cause_of_death = causes,
  count = counts
)

# Sort the simulated dataset by "year"
simulated_data <- simulated_data[order(simulated_data$year), ]

# View the first and last few rows of the simulated dataset
head(simulated_data)
tail(simulated_data)