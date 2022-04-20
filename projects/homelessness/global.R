###### DATA

library(shiny)
library(leaflet)
library(tidyverse)

# import
hld_tidy <- read_csv("https://raw.githubusercontent.com/NearAndDistant/ruk/main/data_scripts/ons_homeless_deaths/hdl_tidy.csv")

####### Spatial Data

# political boundaries
# boundary source: https://osdatahub.os.uk/downloads/open/BoundaryLine

library(sf)
library(sp)
library(rgdal)

# convert shp to rds, compress and upload to DropBox to use from there.
# https://community.rstudio.com/t/how-to-read-shapefiles-from-google-drive-or-any-other-free-repository/101139
# saveRDS(lad, file = here::here("lad_may_2021"), ascii = FALSE, version = NULL, compress = TRUE, refhook = NULL)
lad <- readRDS(url("https://www.dropbox.com/s/tbqdotub8up6ak6/lad_may_2021?dl=1"))

####### JOINING

# transform CRS
lad_tf <- spTransform(lad, CRS("+proj=longlat +datum=WGS84 +no_defs"))

# simplify and recast attribute data
# https://stackoverflow.com/questions/34827043/gsimplify-not-simplifying-shapefile-in-r
lad_sim  <- rgeos::gSimplify(lad_tf, tol = 0.01)
lad_fin <- SpatialPolygonsDataFrame(lad_sim, data = lad_tf@data)
