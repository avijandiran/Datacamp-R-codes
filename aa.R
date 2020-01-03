library(shiny)
library(shinyalert)


profvis({
ui <- fluidPage(
  useShinyalert(),  
  br(),
  br(),
  actionButton("delete", "Delete")
)


a <- "test"

server <- function(input, output, session) {
  
a <- "hello"

observeEvent(input$delete, {
 
 
shinyalert(
  title = "Enter the input to be deleted", type = "input",
  closeOnEsc = TRUE,showCancelButton = T,
  callbackR = function(x) { rm(x) },
  rmcallbackJS = "function(x) { rm(x) } { alert('Deleted ' + x); } }"
  
)

 })
 
   
}

})
shinyApp(ui, server)

