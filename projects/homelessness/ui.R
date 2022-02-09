# create a directory for the Shiny application
#dir.create(here::here("app.R"))

library(tidyverse)

# import
hld_raw <- readxl::read_xlsx("/Users/patrickcorby/Downloads/homelessdeaths2020registrations.xlsx", sheet = "Table 7", skip = 3)

# clean and prepare
hld_cln <- 
  hld_raw %>% 
  janitor::clean_names() %>% 
  select(area_code, area_name, x2020_identified_deaths:x2013_identified_deaths) %>%
  pivot_longer(cols = c(x2020_identified_deaths:x2013_identified_deaths), names_to = "year", values_to = "deaths") %>%
  mutate(year = str_remove(year, "_identified_deaths"),
         year = str_remove(year, "x"),
         year = as.numeric(year)) %>%
  mutate(deaths = if_else(deaths == 0, NA_real_, deaths)) %>%
  mutate(label = if_else(deaths == 0, NA_character_, paste0(area_name, " (", deaths, ")")))

# filter
hld_flt <- hld_cln %>% filter(year == 2019)

#### UI

# Define UI for Good Boys app
ui <- 
  
  fluidPage(
    
    # Sidebar panel for inputs
    sidebarLayout(
      
      # Input: Selector for variable (breed) to plot 
      sidebarPanel(width = 1,
                   selectInput("year", "Year:", choices = hld_flt %>% arrange(year) %>% distinct(year)),
                   tags$style(".well {background-color:white; border: none; box-shadow: none; width: 300px}")),
      
      # Main panel for displaying outputs
      mainPanel(width = 11, plotOutput("hld_map", height = "100%"))
      
    )
    
  )