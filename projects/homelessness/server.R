####### LEAFLET
# http://bboxfinder.com/#0.000000,0.000000,0.000000,0.000000

# palette
palette <- colorNumeric(nord::nord("lumina", reverse = FALSE), domain = c(1:21), na.color = "white")

server <- function(input, output) {
  
  # chooser input: year 
  filtered_input <- 
    reactive({
      lad_fin %>%
      merge(hld_tidy %>% filter(year == input$year), by.x = "LAD21CD", by.y = "area_code", duplicateGeoms = TRUE)  
    })

output$hld_map <-
renderLeaflet({
filtered_input() %>%
# as_Spatial() %>% # this slows everything down
  leaflet(options = leafletOptions(minZoom = 6, maxZoom = 11)) %>% 
  addProviderTiles(provider = "Esri.WorldGrayCanvas") %>%
  setView(lng = -2.1, lat = 55, zoom = 6) %>%      
  addPolygons(weight    = 1,      
              color     = ~palette(deaths),      
              fillOpacity = ~if_else(is.na(deaths), 0,1),       
              label     = ~label) %>%
  addLegend("bottomleft", 
            pal = palette, 
            values = ~deaths,
            title = "Deaths of Homeless People,<br>England and Wales",
            opacity = 1,
            na.label = ""
  )})}
