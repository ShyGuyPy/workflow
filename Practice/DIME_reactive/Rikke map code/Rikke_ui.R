fluidPage(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")),
    titlePanel("This map displays the values and sampling locations of the selected parameter. You may also select a different parameter to display using the drop-down menu below."),
    selectInput("data", "Parameter:",
                c("Secchi Depth" = "Secchi Depth ",
                  "Chlorophyll a" = "Chlorophyll a",
                  "Dissolved Organic Carbon" = "Dissolved Organic Carbon",
                  "Dissolved Inorganic Nitrogen" = "Dissolved Inorganic Nitrogen",
                  "Pheophytin" = "Pheophytin",
                  "Salinity" = "Salinity",
                  "Orthophosphate" = "Orthophosphate")),
    leafletOutput("map", height = 800),
    absolutePanel(
      top = "auto", left = "auto", right = 25, bottom = 735,
      width = "auto", height = "auto",
      actionButton("map_zoom_in", "+", style = 'font-size: 150%'),
      actionButton("map_zoom_out", "-", style = 'font-size:160%')
    )
    )

