library(shiny)
library(leaflet)
shinyApp(
  ui = fluidPage(leafletOutput('nrtmap')),
  server = function(input, output) {
    library(rgdal)
    nrt_ctr <- readOGR("data/all1.shp", layer="all1")
    nrt <- read.csv("data/centre.csv")
    m = leaflet(nrt) %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      setView(37.5, 1.2, 6)  %>% # map location
      addCircles(~XCOORD, ~YCOORD, popup=nrt$NAME, weight = 8, radius=40, 
                     color="red", stroke = TRUE, fillOpacity = 0.8)  %>%
      addPolylines(data=nrt_ctr, color="blue", weight=2.5)
    output$nrtmap = renderLeaflet(m)
  }
)
