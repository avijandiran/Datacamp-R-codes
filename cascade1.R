library(shiny)
ui <- navbarPage("Navbar",
                 navbarMenu("More",
                            tabPanel("Plot", plotOutput("plot")),
                            tabPanel("Summary 1", verbatimTextOutput("summary1")),
                            navbarMenu("Even more",
                                       tabPanel("Summary 2", verbatimTextOutput("summary2")),
                                       tabPanel("Summary 3", verbatimTextOutput("summary3"))
                            )
                 )
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    plot(cars)
  })
  
  output$summary1 <- renderPrint({
    summary(cars)
  })
  
  output$summary2 <- renderPrint({
    summary(mtcars)
  })
  
  output$summary3 <- renderPrint({
    str(mtcars)
  })
}

# Run the application
shinyApp(ui = ui, server = server)