# create a directory for the Shiny application
#dir.create(here::here("app.R"))

#### UI

# Define UI for Good Boys app
ui <- 
  
  fluidPage(
    
    # Main panel for displaying outputs
    mainPanel(width = 12, leafletOutput(outputId = "hld_map", height = "100vh")),
    
    # Sidebar panel for inputs
    absolutePanel(top = 10, left = 70, draggable = TRUE,
      # Input: Selector for variable (breed) to plot 
      sidebarPanel(width = 1,
                   selectInput(inputId = "year", label = "Year:", choices = hld_tidy %>% arrange(desc(year)) %>% distinct(year)),
                   tags$style(".well {background-color:white; border: none; box-shadow: none; width: 300px}")))
    
    )
