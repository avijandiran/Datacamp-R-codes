library(shiny)
library(shinydashboard)

# Define UI for application
ui <- dashboardPage(
  dashboardHeader(title = "Shiny Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Maths", tabName = "menu_1",
               menuSubItem("Algebra", tabName = "sub_1"), 
               menuSubItem("Calculus", tabName = "sub_2")),
      menuItem("Science", tabName = "menu_2",
               menuSubItem("Animals", tabName = "sub_1"), 
               menuSubItem("Plants", tabName = "sub_2")
      )
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "Maths", 
              fluidRow(
                h1("Homepage 1")
              )
      ),
      tabItem(tabName = "Science", 
              fluidRow(
                h1("Homepage 2")
              )
      ),
      tabItem(tabName = "Alebra", 
              fluidRow(
                h1("Sub Menu Page 1")
              )
      ), 
      tabItem(tabName = "Animals", 
              fluidRow(
                h1("Sub Menu Page 2")
              )
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  
}

# Run the application 
shinyApp(ui = ui, server = server)
