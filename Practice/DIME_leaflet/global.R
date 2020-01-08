library(leaflet)
library(shiny)
library(rgdal)
library(jsonlite)
library(tidyverse)
#############################################################################################################################################
raw_data <- read.csv("data/leaflet_maps/data_modified_2.csv")
parameter_data <- raw_data %>%
  drop_na(measurevalue)
# pal <- colorNumeric(palette = c("yellow","darkgreen"), domain = parameter_data$measurevalue)

PRB <- readOGR("data/leaflet_maps/PotomacBasin_Boundary_NHD2003.shp")
HUC8 <- readOGR("data/leaflet_maps/WBDHU8_PotmacBasin_Feb20162.shp")
ches <- readOGR("data/leaflet_maps/ChesBay.shp")
#############################################################################################################################################