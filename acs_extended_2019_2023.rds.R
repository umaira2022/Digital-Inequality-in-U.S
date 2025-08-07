# Load required packages
library(tidycensus)
library(tidyverse)

# Set your Census API key
census_api_key("d3ffbb24a5ea483b7cdd20e9c8cb982cea309503", install = TRUE, overwrite = TRUE)

# Use the ACS codes with custom names
acs_extended <- get_acs(
  geography = "county",
  variables = c(
  broadband_total = "DP02_0152P",
  median_income   = "B19013_001",
  pct_white       = "DP05_0077P",
  pct_bachelor    = "DP02_0067P",
  pct_enrolled    = "DP02_0057P",
  median_age      = "DP05_0018"
),
  year = 2023,
  survey = "acs5",
  cache_table = TRUE
)

# Preview the structure
glimpse(acs_extended)

# Save raw long data
saveRDS(acs_extended, file = "acs_extended_2019_2023.rds")
