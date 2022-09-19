#install.packages("tigris")
library(tidycensus)

#----------install the census API key-----------#
#https://api.census.gov/data/key_signup.html
census_api_key("0d539976d5203a96fa55bbf4421110d4b3db3648",install="TRUE") #this is mine, type ?census_api_key to get yours

#----------Use the census API key to get the decennial data-----------#
#https://api.census.gov/data/2010/dec/sf1/variables.html
age10 <- get_decennial(geography = "state", 
                       variables = "P013001", 
                       year = 2010)

il <- get_decennial(geography = "tract", variables = 'P005003', year = 2010,
                    state = "IL", geometry = TRUE) #White alone


#----------Use the census API key to get the ACS data-----------#
#https://api.census.gov/data/2020/acs/acs5/variables.html
texas_medincome  <- get_acs(geography = "tract", variables = "B19013_001E",
                                 state = "TX", geometry = TRUE)

texas_county_medincome  <- get_acs(geography = "county", variables = "B19013_001E",
                                 state = "TX", geometry = TRUE, year=2018)

Travis_medincome <- get_acs(geography = "tract", variables = "B19013_001E",
                           state = "TX", county = "Travis", geometry = TRUE)

names(Travis_medincome)[4] <- "HHincome"

Travis_female <- get_acs(geography = "tract", variables = "B01001A_017E",
                           state = "TX", county = "Travis", geometry = TRUE)


#install.packages("writexl")

library(writexl)
write_xlsx(x = Travis_female, path = "C:/Users/Wei Zhai/Dropbox (UFL)/UTSA-2022Fall/UTSA-Urban Planning Methods/Week 05/Lab 05/Travis_female.xlsx", col_names = TRUE)
