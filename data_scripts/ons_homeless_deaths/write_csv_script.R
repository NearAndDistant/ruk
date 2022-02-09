library(tidyverse)

# readxl does not currently support downloading from url (as of H2 2021) therefore downloading using temp
temp_ons <- tempfile(fileext = ".xls")

download.file(
  url = "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fbirthsdeathsandmarriages%2fdeaths%2fdatasets%2fdeathsofhomelesspeopleinenglandandwales%2fcurrent/homelessdeaths2020registrations.xlsx",
  destfile = temp_ons)

# read xls
hld_raw <- readxl::read_xlsx(temp_ons, sheet = "Table 7", skip = 3)

# clean and prepare
hld_tidy <- 
  hld_raw %>% 
  janitor::clean_names() %>% 
  select(area_code, area_name, x2020_identified_deaths:x2013_identified_deaths) %>%
  pivot_longer(cols = c(x2020_identified_deaths:x2013_identified_deaths), names_to = "year", values_to = "deaths") %>%
  mutate(year = str_remove(year, "_identified_deaths"),
         year = str_remove(year, "x"),
         year = as.numeric(year)) %>%
  mutate(deaths = if_else(deaths == 0, NA_real_, deaths)) %>%
  mutate(label = if_else(deaths == 0, NA_character_, paste0(area_name, " (", deaths, ")")))

write_csv(hld_tidy , here::here("hdl_tidy.csv"))

