library(shiny)
library(shinydashboard)
library(shinyjs)

shinyApp(
  ui =
    dashboardPage(
      dashboardHeader(),
      dashboardSidebar(),
      dashboardBody(
        shinyjs::useShinyjs(),
        actionButton("showSidebar", "Show sidebar"),
        actionButton("hideSidebar", "Hide sidebar")
      )
    ),
  server = function(input, output, session) {
    observeEvent(input$showSidebar, {
      shinyjs::removeClass(selector = "body", class = "header-collapse")
    })
    observeEvent(input$hideSidebar, {
      shinyjs::addClass(selector = "body", class = "header-collapse")
    })
  }
)