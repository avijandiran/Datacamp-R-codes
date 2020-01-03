library(shiny)
library(plotly)
library(shinydashboard)

d = structure(list(Systems = c("Sys1", "Sys1", "Sys2", "Sys3", "Sys4", 
                               "Sys6", "Sys7"), Locations = c("loc1", "loc1", "loc1", "loc2", 
                                                              "loc2", "loc3", "loc1"), year = structure(c(2L, 1L, 1L, 1L, 1L, 
                                                                                                          3L, 3L), .Label = c("2019", "2018", "0"), class = "factor"), 
                   frequency = c(1L, 2L, 1L, 1L, 1L, 0L, 0L), freq_cal = c(33.33, 
                                                                           66.67, 100, 100, 100, 0, 0), label = c("33.33%", "66.67%", 
                                                                                                                  "100.00%", "100.00%", "100.00%", "0.00%", "0.00%")), row.names = c(NA, 
                                                                                                                                                                                     -7L), class = "data.frame")


ui<-dashboardPage(
  dashboardHeader(title="System Tracker"),
  dashboardSidebar(
    selectInput('slct1',"Select Location",choices = c(" ",d$Locations)),
    actionButton('clear',"Reset Form"),
    h4("Powered by:"),
    tags$img(src='baka.png',height=50,width=50)
  ),
  dashboardBody(
    #fluidRow(
    # box( DT::dataTableOutput("mytable")),
    #     box(plotlyOutput('out'))
    conditionalPanel(
      #Uses a Javascript formatted condition
      condition="input.slct1 !== ' '",
      box(DT::dataTableOutput("mytable")),
      uiOutput("placeholder")
    )
    
  )
)


server<-function(input, output,session) {
  
  output$placeholder = renderUI({
    req(input$slct1)
    box(title = input$slct1,plotlyOutput('out'),status = 'warning',solidHeader = T)
  })
  
  output$mytable = DT::renderDataTable({
    req(input$slct1)
    
    d %>%
      filter(Locations==input$slct1)
    
  })
  
  
  output$out<-renderPlotly({
    req(input$slct1)
    
    data_filter<-d %>%
      filter(Locations==input$slct1)
    
    req(nrow(data_filter)>0)
    
    ggplotly(ggplot(data_filter, aes(Systems,frequency,fill=year)) +
               geom_col(position = 'stack')+geom_text(aes(label=label), position = position_stack(vjust = .5)))#+
    #facet_grid(.~Locations, space= "free_x", scales = "free_x"))
    
  })
  
  
  observeEvent(input$clear,{
    req(input$slct1)
    updateSelectInput(session,"slct1",selected = ' ')
  })
}

shinyApp(ui, server)