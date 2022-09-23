#---------------Measuring the dissimilarity index of a MSA-------------------
Name <- c("Jon", "Bill", "Maria", "Ben", "Tina")
Age <- c(23, 41, 32, 58, 26)
Height <- c(173, 180, 164, 158, 196)
Weight2019 <- c(65, 80, 62, 64,90)
Weight2022 <- c(68, 82, 60, 60,95)
df <- data.frame(Name, Age,Height, Weight2019,Weight2022)

#the difference between year 2019 and 2022 in weight


#the BMI (weight/height) in 2022



#---------------Measuring the dissimilarity index of a MSA-------------------
#install.packages("dplyr")
library(dplyr)
#install.packages("readxl")
library(readxl)

large.tracts<- read_excel("C:/Users/txs401/Dropbox (UFL)/UTSA-2022Fall/UTSA-Urban Planning Methods/Week 06/TX_MSA.xlsx")

large.tracts$wb<- abs(large.tracts$nhblk/large.tracts$nhblkc-large.tracts$nhwhite/large.tracts$nhwhitec)
large.tracts$wh<- abs(large.tracts$hisp/large.tracts$hispc-large.tracts$nhwhite/large.tracts$nhwhitec)


results<-large.tracts %>%
  group_by(NAME) %>%
  summarize(BWD = 0.5*sum(wb, na.rm=TRUE), HWD = 0.5*sum(wh, na.rm=TRUE))
