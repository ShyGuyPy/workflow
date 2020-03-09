



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
                                                 menuItem("One", tabName = "Tab One"),
                                                 menuItem("Two", tabName = "Two"),
                                                 menuItem("Three", tabName = "Three")
                                               )
                              ),#end of dashboardsidebar
                              #E------------------end of sidebar-------------------------

                              #S-----------------dashboard body--------------------------
                              dashboardBody(tabItems(
                              tabItem(tabName = "Tab One"),
                              tabItem(tabName = "Two"),
                              tabItem(tabName = "Three")
                              )

                              ),#end of dashboardbody
                              #E----------------end of dashboard body-----------------------

                )#end of dashboard page
                #E---------------end of dashboard page-----------------------

)#end fluidpage
#E---------------end of fluidpage-----------------------