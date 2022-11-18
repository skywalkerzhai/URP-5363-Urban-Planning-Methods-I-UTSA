library(sf)
library(tigris)
library(ggplot2)

bexar_tracts<- tracts(state = "TX", county = "Bexar",cb=T)

#https://www.sanantonio.gov/GIS/GISData
bike_paths<-st_read(dsn = "C:/Users/txs401/Dropbox (UFL)/UTSA-2022Fall/UTSA-Urban Planning Methods/Week 10/Lab 10/Bike_Facilities/Bike_Facilities.shp")

ggplot(bike_paths)+
  geom_sf()

ggplot(bike_paths)+
  geom_sf(data = bexar_tracts)+
  geom_sf(color='green')


# counties
texas_counties <- counties(state = "TX",cb=T)

#points
tx_landmarks <- landmarks(state = "TX",type = 'point')
head(tx_landmarks)
ggplot()+
  geom_sf(data = texas_counties,fill=NA)+
  geom_sf(data = tx_landmarks,col="red")


# polygons
library(tidycensus)
racevars <- c(White = "P2_005N", 
              Black = "P2_006N", 
              Asian = "P2_008N", 
              Hispanic = "P2_002N")

bexar_race <- get_decennial(geography = "tract", variables = racevars, 
                            state = "TX", county = "Bexar County", geometry = TRUE,
                            output = "wide",year=2020) 

ggplot(data = bexar_race,aes(fill = bexar_race$Hispanic)) +
  geom_sf(color = NA) +
  scale_fill_viridis_c()

