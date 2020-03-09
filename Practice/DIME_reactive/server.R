shinyServer(function(input, output, session) {
  
  reactive_test <- reactive({
    fread( input$radio_select_data,
           header = TRUE, data.table = FALSE
    )
  })
  
  observeEvent(input$action_select_data,{
    if(file.exists("data/reactive_test_data.csv")){
    output$plot <- renderPlot({ggplot(
      reactive_test(), aes(x = date_time, y = flow)
    )
    })
    }
})
  
  
  no_data <- "no data has been selected"
  
  observeEvent(input$action_select_data,{

    if(file.exists("data/reactive_test_data.csv")){
    output$report <-  DT::renderDataTable({reactive_test()})
    }else{output$report <- no_data}

  })
  
  # if(file.exists("data/reactive_test_data.csv")){
  # output$report <- reactive_test
  # }
  

  
  
}) # end shinyServer
