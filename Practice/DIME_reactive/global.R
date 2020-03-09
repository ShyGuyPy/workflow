
library(shiny)
library(shinythemes)
library(shinydashboard)
library(tidyverse)
library(dplyr)
library(shinyjs)
library(data.table)

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