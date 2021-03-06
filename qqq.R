library(shiny)
library(shinydashboard)

ui <- fluidPage(
  dashboardPage(skin = 'black',
                dashboardHeader(title = textOutput('test')),
                dashboardSidebar(
                  sidebarMenu(id = 'MenuTabs',
                              menuItem("dummy", tabName = "rawanalysis", selected = TRUE, icon = icon("dashboard"))
                  )
                ),
                dashboardBody(
                  #uiOutput(outputId = 'Header'),
                  fluidRow(
                    box(
                      actionButton("change", "Change")
                    )
                  ))))


server <- function(input, output,session) {
  
  
  title_change <- reactive({
    input$change
    as.character(Sys.time())
  })
  
  
  observeEvent(input$change, 
               { output$test <- renderText({ title_change()
    
  })
  })
  
  
}

shinyApp(ui = ui, server = server)