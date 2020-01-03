library(shiny)

ui <- fluidPage(
  
  
  tabPanel("Mechanical Timing Plots",
           fluidRow(column(width = 12,tabBox(
             title = "Mechanical Timing Plots", id="CTDPlots",width=12,
             tabPanel(title = "Fast Vac", fluidRow(column(width = 6,
                                                          pickerInput(inputId = "tdms_select_params_FastVac",
                                                                      label = "Select FastVac Features",
                                                                      choices = "Not Loaded!",
                                                                      width = "100%",
                                                                      multiple = FALSE)),
                                                   column(width = 8,br()),
                                                   column(width = 3, actionButton(inputId = "tdms_btn_drawPlot2",
                                                                                                      label = "Draw Plot",
                                                                                                      width = "70%")),tags$style("button#tdms_btn_drawPlot2 {margin-left:auto;margin-right:auto;display:block; background-color:#00CCFF; padding: 5px 25px; font-family:Andika, Arial, sans-serif; font-size:0.89em;font-weight:bold;letter-spacing:0.05em; text-transform:uppercase ;color:#fff; text-shadow: 0px 1px 10px #000;border-radius: 15px;box-shadow: rgba(0, 0, 0, .55) 0 1px 6px;}")),
                      fluidRow( column(width = 4,
                                       radioButtons(inputId = "ctd_radio_plotType",
                                                    label = "Plot Type",
                                                    choices = list("Based on Tool time" = 1,
                                                                   "Based on Count"=2
                                                    ),
                                                    inline=TRUE),selected=1),
                                
                                
                                column(width = 3,actionButton(inputId = "outlier_remove_act_but",
                                                                                  label = "Remove Outliers",
                                                                                  width="50%")),
                                column(width = 3,actionButton(inputId = "reset_button_act_but",
                                                                                  label = "Reset points",
                                                                                  width="50%"))),
                      
                      fluidRow(column(width = 12, div(
                        style = "position:relative",
                        plotOutput(outputId = "tdms_plt_plot2",
                                   width = "100%",
                                   height = "500",
                                   brush = brushOpts(id = "tdms_brush_plot2",
                                                     fill = "#ccc",
                                                     direction = "xy",
                                                     resetOnNew = TRUE),
                                   dblclick = "tdms_dbclick_plot2",
                                   hover = hoverOpts(id = "tdms_hover_plot2",
                                                     delay = 100,
                                                     delayType = "debounce")),
                        uiOutput("tdms_ui_plot2")))))
           )))
))
server <- function(input, output, session) {
  
}

shinyApp(ui, server)
