



# UI---------------------------------------------------------------------------
ui <- fluidPage(useShinyjs(),
                #includeCSS("www/CSS/main.css"),

                #S------------dashboard page------------------------------
                dashboardPage(skin = "blue",

                              #S------------dashboard header----------------------------
                              dashboardHeader(title = "Reactive test", titleWidth = 300,
                                              .list = NULL
                              ),#end of dashboardheader
                              #E-------------------end dashboard header---------------------

                              #S-------------------sidebar---------------------------
                              dashboardSidebar(width = 200,
                                               sidebarMenu(
                                                 menuItem("Select", tabName = "select_tab"),
                                                 menuItem("Report", tabName = "report_tab"),
                                                 menuItem("Graph", tabName = "graph_tab"),
                                                 menuItem("Map", tabName = "map_tab")
                                               )
                              ),#end of dashboardsidebar
                              #E------------------end of sidebar-------------------------

                              #S-----------------dashboard body--------------------------
                              dashboardBody(tabItems(
                              tabItem(tabName = "select_tab",
                                      radioButtons("radio_select_data", "Select Data",
                                                   c("Some Data" = "data/reactive_test_data.csv",
                                                     "No Data" = "bd2")),
                                      
                                      actionButton("action_select_data", "Confirm Selection",
                                                   icon = NULL,
                                                   width = "500px")
                                      
                                      
                                      ),
                              tabItem(tabName = "report_tab", 
                                      DT::dataTableOutput("report")),
                              tabItem(tabName = "graph_tab",
                                      plotOutput("plot", width = "500px", height = "500px")),
                              tabItem(tabName = "map_tab")
                              )

                              ),#end of dashboardbody
                              #E----------------end of dashboard body-----------------------

                )#end of dashboard page
                #E---------------end of dashboard page-----------------------

)#end fluidpage
#E---------------end of fluidpage-----------------------