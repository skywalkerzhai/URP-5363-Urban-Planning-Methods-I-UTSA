library(tigris)
library(tidycensus)
library(sf)
library(ggplot2)

#get the boundary pf bexar county
texas_counties<-counties(state = "Texas",cb=T)
bexar<-texas_counties[texas_counties$NAME=="Bexar",]
bexar<-st_transform(bexar,crs = 4326) #define the coordinate reference system

bexar_race <- get_decennial(geography = "tract", variables = "P2_002N",  #Hispanic
                            state = "TX", county = "Bexar County", geometry = TRUE,
                            output = "wide",year=2020) 
plot(bexar_race)
bexar_race<-st_transform(bexar_race,crs = 4326)

##import corridor plans in San Antonio
CorridorPlans <- st_read(dsn="C:/Users/txs401/Dropbox (UFL)/UTSA-2022Fall/UTSA-Urban Planning Methods/Week 11/Lab11/CorridorPlans/CorridorPlans/CorridorPlans.shp")
#convert the coordinate system of bexar race to that of red band
CorridorPlans<-st_transform(CorridorPlans,crs = 4326)
plot(CorridorPlans)

##Intersect Bexar county with CorridorPlans
intersection <- st_intersection(bexar,CorridorPlans)
plot(intersection)
ggplot()+geom_sf(data = intersection,fill=NA)

##Intersect Bexar county census tracts with CorridorPlans
intersection_race <- st_intersection(bexar_race,CorridorPlans)
plot(intersection_race)
ggplot()+geom_sf(data = intersection_race,fill=NA)

##Union Bexar county with CorridorPlans
union <- st_union(CorridorPlans, bexar)
ggplot()+
  geom_sf(data = union)

#create a 500m buffer for corridor plan
CorridorPlans_buffer <- st_buffer(CorridorPlans, 500)
ggplot()+
  geom_sf(data = bexar)+
  geom_sf(data = CorridorPlans_buffer)

##visualize corridor plan without buffer
ggplot()+
  geom_sf(data = bexar)+
  geom_sf(data = CorridorPlans)
