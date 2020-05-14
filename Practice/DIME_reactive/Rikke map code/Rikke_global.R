library(leaflet)
library(shiny)
library(rgdal)
library(tidyverse)
library(leaflet.minicharts)
#############################################################################################################################################
raw_data <- read.csv("data_modified_2.csv")
parameter_data <- raw_data %>%
  drop_na(measurevalue)

parameter_data$latitude <- jitter(parameter_data$latitude, factor = 7)
parameter_data$longitude <- jitter(parameter_data$longitude, factor = 7)

PRB <- readOGR("C:/Users/RJepson/Documents/GIS data/Hydrology/Potomac River basin/PotomacBasin_Boundary_NHD2003.shp")
HUC8 <- readOGR("C:/Users/RJepson/Documents/DIME/R scripts/DIME Shiny/WBDHU8_PotmacBasin_Feb20162.shp")
ches <- readOGR("C:/Users/RJepson/Documents/GIS data/Hydrology/Chesapeake Bay watershed/ChesBay.shp")
gage <- readOGR("C:/Users/RJepson/Documents/DIME/gages_clipped.shp")

