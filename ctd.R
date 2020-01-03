library(shiny)
library(shinydashboard)

ui <- fluidPage(
  tabItem(tabName = "ctdFiles",fluidRow(column(width = 12,
                                               box(title = "Load Data", width = 12,solidHeader = T, status = "info", collapsible = TRUE,
                                                   fluidRow(column(width = 3,
                                                                   selectInput(inputId = "ctd_select_chamber",
                                                                               label = "Select Fleet",
                                                                               choices = "Not Loaded!",
                                                                               width = "80%")),
                                                            
                                                            column(width = 3,
                                                                   selectInput(inputId = "ctd_select_tool",
                                                                               label = "Select Tool",
                                                                               choices = "Not Loaded!",
                                                                               width = "80%")),
                                                            
                                                            column(width = 3,
                                                                   dateRangeInput(inputId = "ctd_dateRange_loadData",
                                                                                  label = "",
                                                                                  width = "80%")),
                                                            
                                                            column(width=3,br()),
                                                            column(width = 3,
                                                                   (actionButton(inputId = "ctd_btn_loadData",
                                                                                                    label = "Load Sensors",
                                                                                                    width = "70%")),(tags$style("button#ctd_btn_loadData {margin-left:auto;margin-right:auto;display:block; background-color:#00CCFF; padding: 5px 25px; font-family:Andika, Arial, sans-serif; font-size:0.89em;font-weight:bold;letter-spacing:0.05em; text-transform:uppercase ;color:#fff; text-shadow: 0px 1px 10px #000;border-radius: 15px;box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;}")))))))
)
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)