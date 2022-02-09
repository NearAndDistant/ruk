library(tidyverse)

###### DATA

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

####### Spatial Data

# political boundaries
# boundary source: https://osdatahub.os.uk/downloads/open/BoundaryLine

library(sf)
library(rgdal)

# Counties and Unitary Authorities (Northamponshire, Buckinghamshire, Dorset)
lad <- 
  readOGR( 
    dsn     = "/Users/patrickcorby/Documents/Data/Local_Authority_Districts_(May_2021)_UK_BFE_V3", 
    layer   = "LAD_MAY_2021_UK_BFE_V2",
    verbose = FALSE) 

# convert to sf
lad_sf <- 
  st_as_sf(lad) %>% 
  rmapshaper::ms_simplify() %>%
  janitor::clean_names() %>%
  select(area_code = "lad21cd", area_name = "lad21nm", long, lat, geometry)

####### JOINING

# transform CRS
lad_tf <- spTransform(CRS("+proj=longlat +datum=WGS84 +no_defs"))

# merge spactial object
hld_lad_shp <- sp::merge(lad_tf, hld_flt, by.x = "LAD21CD" , by.y = "area_code", duplicateGeoms = TRUE)

####### LEAFLET

library(leaflet)
# http://bboxfinder.com/#0.000000,0.000000,0.000000,0.000000

palette <- colorNumeric(nord::nord("lumina"), domain = hld_lad_shp@data$deaths, na.color = "white")

server <- function(input, output) {
  
filtered_input <- reactive({hdl_lad_shp %>% filter(year == input$year)})

output$hld_map <-
renderPlot({
filtered_input %>%
  leaflet(options = leafletOptions(minZoom = 6, maxZoom = 11)) %>% 
  addProviderTiles(provider = "Esri.WorldGrayCanvas") %>%
  setView(lng = -2.1, lat = 55, zoom = 6) %>%      
  addPolygons(weight    = 1,      
              color     = ~palette(deaths),      
              fillOpacity = ~if_else(is.na(deaths), 0,1),       
              label     = ~label)}, 

height = 800, width = 800)}
