fluidPage(
  titlePanel("This map displays the sampling locations of the parameter selected earlier. Alternately, you can select a different parameter to display using the drop-down menu below."),
  
  tags$head(
    #this links the shiny app to main.css which can be used to easily define and 
    #alter styles(color,font size, alignments) across allui/server elements
    tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")),
  
  selectInput("data", "Parameter:",
              c("Secchi Depth" = "Secchi Depth ",
                "Chlorophyll a" = "Chlorophyll a",
                "Dissolved Organic Carbon" = "Dissolved Organic Carbon",
                "Dissolved Inorganic Nitrogen" = "Dissolved Inorganic Nitrogen",
                "Pheophytin" = "Pheophytin",
                "Salinity" = "Salinity",
                "Orthophosphate" = "Orthophosphate")),
  leafletOutput("map", height = 800)
)