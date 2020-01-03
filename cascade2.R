library(shiny)
ui <- navbarPage("App Title",
                 tabPanel("Plot"),
                 navbarMenu("More",
                            tabPanel("Summary"),
                            tabPanel("Table")),
                 navbarMenu("Still more",
                            tabPanel("Foo")
                 )
)

shinyApp(ui=ui, server=function(input, output) {}) 

