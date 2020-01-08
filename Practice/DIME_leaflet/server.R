shinyServer(function(input, output, session) {

  select_data <- reactive({
    parameter_data <- parameter_data %>%
      filter(parameter == as.character(input$data))
    
  })
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(-78.193593, 38.917359, zoom = 7.5) %>%
      addPolygons(data = HUC8, fill = FALSE, weight = 2, color = "steelblue", group = "HUC8") %>%
      addPolygons(data = PRB, fill = FALSE, weight = 3, color = "navy", group = "Potomac River Watershed") %>%
      addPolygons(data = ches, fill = FALSE, weight = 3, color = "navy", group = "Chesapeake Bay Watershed") %>%
      addLayersControl(overlayGroups = c("Chesapeake Bay Watershed", "Potomac River Watershed", "HUC8"), position = "bottomleft",
                       options = layersControlOptions(collapsed = FALSE)) %>%
      hideGroup("Chesapeake Bay Watershed") #%>%
    # addLegend("bottomleft", pal = pal, values = parameter_data$measurevalue, title = as.character(input$data), opacity = 1)
  })
  
  observe({
    parameter_data <- select_data()
    proxy <- leafletProxy("map", data = parameter_data) %>%
      clearMarkers() %>%
      addCircleMarkers(data = parameter_data,
                       lng = ~longitude,
                       lat = ~latitude,
                       radius = 2,
                       color = ~ pal(parameter_data$measurevalue),
                       stroke = TRUE,
                       fillOpacity = 0.5,
                       popup=paste('<b>Date:</b>', parameter_data$sampledate, "<br>",
                                   '<b>Value:</b>', parameter_data$measurevalue, "<br>",
                                   '<b>Unit:</b>', parameter_data$unit, "<br>",
                                   '<b>Station:</b>', parameter_data$station, "<br"),
                       options = popupOptions(maxHeight = 50))
  })
  
  observe({
    pal <- colorNumeric(palette = c("yellow","darkgreen"), domain = select_data()$measurevalue)
    
    proxy <- leafletProxy("map", data = parameter_data) %>%
      clearControls() %>%
      addLegend("bottomleft", pal = pal, values =select_data()$measurevalue, title = as.character(input$data), opacity = 1)
  })

}) # end shinyServer