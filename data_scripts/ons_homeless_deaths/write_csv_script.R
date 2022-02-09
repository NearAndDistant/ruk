library(tidyverse)

# readxl does not currently support downloading from url (as of H2 2021) therefore downloading using temp
temp_ons <- tempfile(fileext = ".xls")

download.file(
  url = "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fbirthsdeathsandmarriages%2fdeaths%2fdatasets%2fdeathsofhomelesspeopleinenglandandwales%2fcurrent/homelessdeaths2020registrations.xlsx",
  destfile = temp_ons)

# read xls
hld_raw <- readxl::read_xlsx(temp_ons, sheet = "Table 7", skip = 3)

write_csv(hld_raw , here::here("hdl_raw.csv"))

