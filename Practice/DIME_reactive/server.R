shinyServer(function(input, output, session) {
  
  reactive_test <- reactive({
    fread( input$radio_select_data,
           header = TRUE, data.table = FALSE
    )
  })
  
  observeEvent(input$action_select_data,{
    if(file.exists("data/reactive_test_data.csv")){
    output$plot <- renderPlot({ggplot(
      reactive_test(), aes(x = sampledate, y = measurevalue)
    )+ geom_line()
    })
    }
})
  
  
  no_data <- "no data has been selected"
  
  observeEvent(input$action_select_data,{

    if(file.exists("data/reactive_test_data.csv")){
    output$report <-  DT::renderDataTable({reactive_test()})
    }else{output$report <- no_data}

  })
  
  
  output$map <- renderLeaflet({
    leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
      addTiles() %>%
      setView(-78.193593, 38.917359, zoom = 7.5) %>%
      addPolygons(data = HUC8, fill = FALSE, weight = 2, color = "steelblue", group = "HUC8") %>%
      addPolygons(data = PRB, fill = FALSE, weight = 3, color = "navy", group = "Potomac River Watershed") %>%
      addPolygons(data = ches, fill = FALSE, weight = 3, color = "navy", group = "Chesapeake Bay Watershed") %>%
      addCircles(data = gage, lng = ~LONDD, lat = ~LATDD, group = "USGS Stream Gage",
                 popup=paste('<strong>Name:</strong>', gage$STATION_NM, "<br>",
                             '<strong>ID:</strong>', gage$STATION_NO)) %>%
      addLayersControl(overlayGroups = c("Potomac River Watershed", "Chesapeake Bay Watershed", "HUC8", "USGS Stream Gage"), position = "bottomleft",
                       options = layersControlOptions(collapsed = FALSE)) %>%
      hideGroup("Chesapeake Bay Watershed") %>%
      hideGroup("USGS Stream Gage")
  })
  

    observeEvent(input$action_select_data,{
      
      if(file.exists("data/reactive_test_data.csv")){
      #pal <- colorNumeric(palette = c("yellow","purple"), domain = reactive_test()$measurevalue)
      
      proxy <- leafletProxy("map", data = reactive_test()$measurevalue) %>%
        clearMarkers() %>%
        addCircleMarkers(data = reactive_test(),
                         lng = ~longitude,
                         lat = ~latitude,
                         radius = 6,
                         fillColor = ~ "Blues",
                           pal(reactive_test()$measurevalue),
                         stroke = TRUE,
                         weight = 1,
                         color = "black",
                         fillOpacity = 1,
                         label = paste(as.Date(reactive_test()$sampledate)),
                         popup=paste('<strong>Date:</strong>', reactive_test()$sampledate, "<br>",
                                     '<strong>Value:</strong>', reactive_test()$measurevalue, "<br>",
                                     '<strong>Unit:</strong>', reactive_test()$unit, "<br>",
                                     '<strong>Station:</strong>', reactive_test()$station, "<br",
                                     '<strong>Latitude:</strong>', formatC(reactive_test()$latitude, digits = 4, format = "f"), "<br",
                                     '<strong>Longitude:</strong>', formatC(reactive_test()$longitude, digits = 4, format = "f")),
                         options = popupOptions(maxHeight = 50)
        )#end of addCircleMarkers
                         
                         pal <- colorNumeric(palette = c("yellow","purple"), domain = reactive_test()$measurevalue)
      }#end of if(file.exists)                
    })#end of observeEvent

   

 
  
  # Zoom control - zoom out
  observeEvent(input$map_zoom_out ,{
    leafletProxy("map") %>%
      setView(lat  = (input$map_bounds$north + input$map_bounds$south) / 2,
              lng  = (input$map_bounds$east + input$map_bounds$west) / 2,
              zoom = input$map_zoom - 1)
  })
  # Zoom control - zoom in
  observeEvent(input$map_zoom_in ,{
    leafletProxy("map") %>%
      setView(lat  = (input$map_bounds$north + input$map_bounds$south) / 2,
              lng  = (input$map_bounds$east + input$map_bounds$west) / 2,
              zoom = input$map_zoom + 1)
  })

  
  
}) # end shinyServer
