# server <- function(input, output, session) {
#   
#   active_data.df <- reactive({
#     if(file.exists(paste0("data/active_data.csv"))){
#       data.table::fread(paste0("data/active_data.csv"),
#             header = TRUE,
#             data.table = FALSE)
#     }#end of if exists
#   })
#   
#   # active_data.df <- data.table::fread(paste0("data/CEDR/data_raw.csv"),
#   #                                 header = TRUE,
#   #                                   data.table = FALSE)
# 
#   active_data.df <- data.table::fread(paste0("data/active_data.csv"),#"data/CEDR/one_param_data.csv"),
#                                       header = TRUE,
#                                       data.table = FALSE)
#   
#   # test <- reactive({
#   salinity.df <- active_data.df %>%
#     filter(parameter == "salinity")
#   # })
#   
#   din.df <- active_data.df %>%
#     filter(parameter == "din")
#   
#   secchi.df <- active_data.df %>%
#     filter(parameter == "secchi")
#   
#   po4.df <- active_data.df %>%
#     filter(parameter == "po4")
#   
#   chla.df <- active_data.df %>%
#     filter(parameter == "chla")
#   
#   pheo.df <- active_data.df %>%
#     filter(parameter == "pheo")
#   
#   doc.df <- active_data.df %>%
#     filter(parameter == "doc")
#   
#   
#   
#   #   output$test1 <- renderText({
#   #   paste("tab1", input$rb)
#   # })
#   #   
#   #   output$test2 <- renderText({
#   #   paste("tab2", input$rb)
#   # })
#   #       
#   #   output$test3 <- renderText({
#   #   paste("tab3", input$rb)
#   # })
#   # 
#   output$map1 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = salinity.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
#   
#   output$map2 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = din.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
#   
#   output$map3 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = secchi.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
#   
#   output$map4 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = po4.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
#   
#   output$map5 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = chla.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
#   
#   output$map6 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = pheo.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
#   
#   output$map7 <- renderLeaflet({
#     leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
#       addTiles() %>%
#       setView(-78.193593, 38.917359, zoom = 5.5) %>%
#       addCircleMarkers(data = doc.df,
#                        lng = ~longitude,
#                        lat = ~latitude,
#                        radius = 2)
#   })
# }




shinyServer(function(input, output, session) {
  #to hide sidebar
  #addClass(selector = "body", class = "sidebar-collapse")
  
  
  #if(file.exists(paste0(active_path, "active_data.csv"))){
  
  active_data.df <- reactive({
    if(file.exists(multi_tab_active_file)){
      #paste0(active_path, "active_data.csv"))){
      fread(multi_tab_active_file,
        #paste0(active_path, "active_data.csv"),
            data.table = FALSE)
    }#end of if exists
  })
  
  #}
  
  # source("code/server/download_data_server.R", local = TRUE)
  # source("code/server/select_data_server.R", local = TRUE)
  # source("code/server/error_report_server.R", local = TRUE)
  # source("code/server/summary_page_server.R", local = TRUE)
  # source("code/server/plot_data_server.R", local = TRUE)
  source("code/server/map_data_server.R", local = TRUE)
  
  
  
  
}) # end shinyServer