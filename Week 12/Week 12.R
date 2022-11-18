'Suppose a client wants to build a cabin in Rusk County, 
Wisconsin and requests that it be situated 

----Below 365m
----On a slope of less than 3 degrees
----Facing northeast, east, or southeast (angle between 
    22.5 and 157.5 degrees)'

library(tigris)
library(raster)
library(dplyr)
library(sf)
library(leaflet)

wi.dem <- raster("C:/Users/txs401/Dropbox (UFL)/UTSA-2022Fall/UTSA-Urban Planning Methods/Week 12/Lab/Data/DEM_30m/DEM_30m/demgw930/")

#retrieve all the countiy shapefile in WI
wi_counties <- counties(state ="WI", class = "sf", cb = TRUE, progress_bar = FALSE) 

#only keep the shapefile of Rusk County
rusk<-wi_counties[wi_counties$NAME=="Rusk",]
rusk <- st_transform(rusk, crs(wi.dem)) #coordinate reference system

rusk.dem <- crop(wi.dem, rusk)

plot(rusk.dem, main = "Rusk County DEM")
plot(wi.dem)

## Elevation criteria
plot(rusk.dem < 365, main = "Elevation criteria",
     col = c("#ffffff", "#0000ff"))

## Slop criteria; terrain
plot(terrain(rusk.dem, opt = "slope", unit = "degrees") < 3, 
     main = "Slope criteria",
     col = c("#ffffff", "#ff9900"))

## Aspect criteria
plot(terrain(rusk.dem, opt = "aspect", unit = "degrees") > 22.5 &
     terrain(rusk.dem, opt = "aspect", unit = "degrees") < 157.5, 
     main = "Aspect criteria")

rusk.suit <-
  ## elevation; under 365m 
  rusk.dem < 365 &
  ## aspect; between 22.5 and 157.5 degrees
  terrain(rusk.dem, opt = "aspect", unit = "degrees") > 22.5 &
  terrain(rusk.dem, opt = "aspect", unit = "degrees") < 157.5 &
  ## slope; less than 3 degrees
  terrain(rusk.dem, opt = "slope", unit = "degrees") < 3

plot(rusk.suit)

### Not required for students####
library(rasterVis)
plot3D(wi.dem) 

leaflet(rusk.suit) %>% addTiles()
## save the map
