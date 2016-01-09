server = function(input, output) {
  library(rgdal)
  nrt_ctr <- readOGR("data/all1.shp", layer="all1") 
  m = leaflet() %>%
    addTiles() %>%  # Add default OpenStreetMap map tiles
    setView(37.5, 1.2, 6)  %>% # map location
    addPolylines(data=nrt_ctr, color="blue", weight=2.5)
  output$nrtmap = renderLeaflet(m)
}
