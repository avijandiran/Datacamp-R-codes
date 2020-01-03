library(shiny)


ui <- dashboardPage(
  dashboardHeader(title="Data Analysis"),
  dashboardSidebar(
    sidebarMenu(id="list",
                menuItem("Data Source",tabName = "datas"),
                menuItem("Data Cleaning",tabName = "datac"),
                menuItem("Model Building",tabName = "modelb"),
                menuItem("Data visualization",tabName = "datav")
                
    )
  ),
  
  
  
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "datas",
              fluidRow(h4("Dataset of Mtcars"),column(12,DT::dataTableOutput("table1"))),
              fluidRow(column(12,actionButton("button1","Next")))),
      
      tabItem(tabName = "datac", h3("Summary of mtcars"),
              fluidRow(column(12,verbatimTextOutput("text1"))),
              fluidRow(column(12,h3("correlation"),plotOutput("plot1"))),
              br(),
              fluidRow(column(12,offset =-6,actionButton("button2","Next")))
      ),
      
      tabItem(tabName = "modelb",
              fluidRow(column(6,h3("Model A"),verbatimTextOutput("text2")),
                       column(6,h3("Model B"),verbatimTextOutput("text3"))),
              br(),
              fluidRow(column(12,offset =-6,actionButton("button3","Next")))
      ),
      
      tabItem(tabName = "datav",
              fluidRow(column(12,h3("Plot 1"),plotOutput("plot2"))),
              fluidRow(column(12,h3("Plot 2"),plotOutput("plot3"))
              ))
    )
  )
  
)
 
      
      
shinyApp(ui=ui, server=function(input, output) {})