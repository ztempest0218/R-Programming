rm(list = ls())

library(dplyr)

# 1. Read data
co2_raw <- read.csv(
  "https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv"
)

energy_raw <- read.csv(
  "https://raw.githubusercontent.com/owid/energy-data/master/owid-energy-data.csv"
)

# 2. Dimensions
dim_co2 <- dim(co2_raw)
dim_energy <- dim(energy_raw)

# 3. Select variables from CO2 data
co2_selected <- co2_raw %>%
  filter(iso_code != "") %>%
  select(
    country,
    iso_code,
    year,
    co2,
    co2_per_capita,
    population,
    gdp
  )

# 4. Select variables from energy data
energy_selected <- energy_raw %>%
  filter(iso_code != "") %>%
  select(
    country_energy = country,
    iso_code,
    year,
    primary_energy_consumption,
    fossil_fuel_consumption,
    fossil_share_energy,
    renewables_consumption,
    renewables_share_energy
  )

# 5. Join by iso_code and year
merged_data <- left_join(
  co2_selected,
  energy_selected,
  by = c("iso_code", "year"),
  relationship = "one-to-one"
)

# 6. Row counts before and after joining
n_co2_selected <- nrow(co2_selected)
n_merged_data <- nrow(merged_data)

# 7. Missing values by column
missing_summary <- colSums(is.na(merged_data))

# 8. Select four countries after 2000
selected_countries <- merged_data %>%
  filter(
    country %in% c("Japan", "United States", "China", "Germany"),
    year >= 2000
  )




