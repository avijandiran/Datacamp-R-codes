
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
                                                                                                  label = "Load Data",
                                                                                                  width = "50%")),(tags$style("button#ctd_btn_loadData {margin-left:auto;margin-right:auto;display:block; background-color:#00CCFF; padding: 5px 25px; font-family:Andika, Arial, sans-serif; font-size:0.89em;font-weight:bold;letter-spacing:0.05em; text-transform:uppercase ;color:#fff; text-shadow: 0px 1px 10px #000;border-radius: 15px;box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;}"))))))),
        
        fluidRow(column(width = 12,
                        tabBox(title = "CTD Plots", id = "CTDPlots", width = 12,
                               tabPanel(title = "SPC Plot",fluidRow(column(width = 4,
                                                                           selectizeInput(inputId = "ctd_select_sensors",
                                                                                          label = "Select Sensor",
                                                                                          choices = "Not Loaded!",
                                                                                          selected = NULL,
                                                                                          width = "100%",
                                                                                          multiple = FALSE)),
                                                                    column(width = 8,br()),
                                                                    column(width = 3,
                                                                           (actionButton(inputId = "ctd_btn_loadSensorData",
                                                                                                            label = "Draw Plot",
                                                                                                            width = "70%")),tags$style("button#ctd_btn_loadSensorData {margin-left:auto;margin-right:auto;display:block; background-color:#00CCFF; padding: 5px 25px; font-family:Andika, Arial, sans-serif; font-size:0.89em;font-weight:bold;letter-spacing:0.05em; text-transform:uppercase ;color:#fff; text-shadow: 0px 1px 10px #000;border-radius: 15px;box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;;}"))),
                                        column(width =1,br()),
                                        fluidRow( column(width = 12,
                                                         radioButtons(inputId = "ctd_radio_ruleType",
                                                                      label = "Rules",
                                                                      choices = list("Rule 1" = 1,
                                                                                     "Rule 2" = 2),inline=TRUE),selected=1) ),
                                        fluidRow(column(width = 12, div(
                                          style = "position:relative",
                                          plotOutput(outputId = "spc_plt_plot",
                                                     width = "100%",
                                                     height = "800",
                                                     brush = brushOpts(id = "spc_brush_plot",
                                                                       fill = "#ccc",
                                                                       direction = "xy",
                                                                       resetOnNew = TRUE),
                                                     dblclick = "spc_dbclick_plot",
                                                     hover = hoverOpts(id = "spc_hover_plot",
                                                                       delay = 100,
                                                                       delayType = "debounce")),
                                          uiOutput("spc_ui_plot")))
                                        )),
                               tabPanel(title = "Pressure Plots",fluidRow(column(width = 6,
                                                                                 pickerInput(inputId = "tdms_select_params",
                                                                                             label = "Select Features",
                                                                                             choices = "Not Loaded!",
                                                                                             selected = NULL,
                                                                                             width = "100%",
                                                                                             multiple = FALSE)),
                                                                          column(width = 1,br()),
                                                                          column(width = 4,
                                                                                (actionButton(inputId = "tdms_btn_drawPlot",
                                                                                                                  label = "Draw Plot",
                                                                                                                  width = "70%")),tags$style("button#tdms_btn_drawPlot {margin-left:auto;margin-right:auto;display:block; background-color:#00CCFF; padding: 5px 25px; font-family:Andika, Arial, sans-serif; font-size:0.89em;font-weight:bold;letter-spacing:0.05em; text-transform:uppercase ;color:#fff; text-shadow: 0px 1px 10px #000;border-radius: 15px;box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;}")),
                                                                          column(width =1,br()),
                                                                          fluidRow( column(width = 12,
                                                                                           radioButtons(inputId = "tdms_radio_plotType",
                                                                                                        label = "Plot Type",
                                                                                                        choices = list("linear value" = 1,
                                                                                                                       "Log Value" = 2),inline=TRUE),selected=1)),
                                                                          fluidRow(column(width = 12, div(
                                                                            style = "position:relative",
                                                                            plotOutput(outputId = "tdms_plt_plot",
                                                                                       width = "100%",
                                                                                       height = "800",
                                                                                       brush = brushOpts(id = "tdms_brush_plot",
                                                                                                         fill = "#ccc",
                                                                                                         direction = "xy",
                                                                                                         resetOnNew = TRUE),
                                                                                       dblclick = "tdms_dbclick_plot",
                                                                                       hover = hoverOpts(id = "tdms_hover_plot",
                                                                                                         delay = 100,
                                                                                                         delayType = "debounce")),
                                                                            uiOutput("tdms_ui_plot")))
                                                                          )
                               )
                               ),
                               tabPanel(title = "Pressure Overlay Plots",fluidRow(fluidRow( column(width = 3,
                                                                                                   pickerInput(inputId = "tdms_select_params1",
                                                                                                               label = "Select Features",
                                                                                                               choices = "Not Loaded!",
                                                                                                               selected = NULL,
                                                                                                               width = "100%",
                                                                                                               multiple = FALSE)),
                                                                                            
                                                                                            column(width = 2,
                                                                                                   selectizeInput(inputId = "tdms_select_params2",
                                                                                                                  label = "Select",
                                                                                                                  choices = c("Before","After"),
                                                                                                                  width = "50%",
                                                                                                                  selected = "Before",
                                                                                                                  multiple = FALSE)),
                                                                                            
                                                                                            
                                                                                            column(width = 3,
                                                                                                   pickerInput(inputId = "tdms_select_params_Open",
                                                                                                               label = "Select Open Features",
                                                                                                               choices = "Not Loaded!",
                                                                                                               selected = NULL,
                                                                                                               width = "100%",
                                                                                                               multiple = FALSE)),
                                                                                            
                                                                                            column(width = 4,
                                                                                                   pickerInput(inputId = "tdms_select_params_Close",
                                                                                                               label = "Select Closed Features",
                                                                                                               choices = "Not Loaded!",
                                                                                                               selected = NULL,
                                                                                                               width = "100%",
                                                                                                               multiple = FALSE))),
                                                                                  
                                                                                  fluidRow(
                                                                                    column(width = 4,
                                                                                           numericInput("numeric","Enter time(in seconds)",value = 0.25,width="50%" ))),
                                                                                  
                                                                                  column(width =5,br()),
                                                                                  column(width = 4, 
                                                                                         (actionButton(inputId = "tdms_btn_drawPlot1",
                                                                                                                          label = "Draw Plot",
                                                                                                                          width = "70%")),tags$style("button#tdms_btn_drawPlot1 {margin-left:auto;margin-right:auto;display:block; background-color:#00CCFF; padding: 5px 25px; font-family:Andika, Arial, sans-serif; font-size:0.89em;font-weight:bold;letter-spacing:0.05em; text-transform:uppercase ;color:#fff; text-shadow: 0px 1px 10px #000;border-radius: 15px;box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;}")),
                                                                                  
                                                                                  column(width =1,br()),
                                                                                  # fluidRow( column(offset=1,width = 12,
                                                                                  #                  radioButtons(inputId = "tdms_radio_plotType",
                                                                                  #                               label = "Plot Type",
                                                                                  #                               choices = list("linear value" = 1,
                                                                                  #                                              "Log Value" = 2),inline=TRUE),selected=1) ),
                                                                                  fluidRow(column(width = 12, div(
                                                                                    style = "position:relative",
                                                                                    plotOutput(outputId = "tdms_plt_plot1",
                                                                                               width = "100%",
                                                                                               height = "500",
                                                                                               brush = brushOpts(id = "tdms_brush_plot1",
                                                                                                                 fill = "#ccc",
                                                                                                                 direction = "xy",
                                                                                                                 resetOnNew = TRUE),
                                                                                               dblclick = "tdms_dbclick_plot1",
                                                                                               hover = hoverOpts(id = "tdms_hover_plot1",
                                                                                                                 delay = 100,
                                                                                                                 delayType = "debounce")),
                                                                                    uiOutput("tdms_ui_plot1")))
                                                                                  )))
                               
                               
                               
                        )))))


server <- function(input, output, session) {
  
}

shinyApp(ui, server)

