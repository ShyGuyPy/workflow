
library(shiny)
library(shinythemes)
library(shinydashboard)
library(tidyverse)
library(dplyr)
library(shinyjs)
library(data.table)
library(leaflet)
library(leaflet.minicharts)
library(rprojroot)
library(ggplot2)
library(rgdal)

project.dir <- rprojroot::find_rstudio_root_file()

map_path <- "data/leaflet_maps/"

PRB <- readOGR(paste0(map_path,"PotomacBasin_Boundary_NHD2003.shp"))
HUC8 <- readOGR(paste0(map_path,"WBDHU8_PotmacBasin_Feb20162.shp"))
ches <- readOGR(paste0(map_path,"ChesBay.shp"))
gage <- readOGR(paste0(map_path,"gages_clipped.shp"))

# PRB <- readOGR(file.path(project.dir,map_path,"PotomacBasin_Boundary_NHD2003.shp"))
# HUC8 <- readOGR(file.path(project.dir,map_path,"WBDHU8_PotmacBasin_Feb20162.shp"))
# ches <- readOGR(file.path(project.dir,map_path,"ChesBay.shp"))
# gage <- readOGR(file.path(project.dir,map_path,"gages_clipped.shp"))

# reactive_test <- reactive({
#  fread( input$action_select_data,
#         header = TRUE, data.table = FALSE
#  )
# })

# 
# observeEvent(input$action_select_data,{
#   reactive_test <- fread( input$radio_select_data,
#                           header = TRUE, data.table = FALSE
#       )
# })