library(shiny)
library(shinyalert)

ui <- fluidPage(
  useShinyalert(),  # Set up shinyalert
  actionButton("preview", "Preview")
)

server <- function(input, output, session) {
  observeEvent(input$preview, {
    # Show a modal when the button is pressed
    # shinyalert("Oops!", "Something went wrong.", type = "error")
    
    # 
  #   
  #   shinyalert(
  #     "Enter your name", type = "input",
  #     callbackR = function(x) { if(x != FALSE) message("Hello ", x) },
  #     callbackJS = "function(x) { if (x !== false) { alert('Hello ' + x); } }"
  #   )
  # })
    
    
    shinyalert(
      title = "What is your name?", type = "input",
      callbackR = function(value) { shinyalert(paste("Welcome", value)) }
    )
  
})
    
   #  shinyalert(title = "You did it!", type = "success")
   # })
   # 
  
  
  # shinyalert(
  #   title = "Enter the number", type = "input",inputType="number",
  #   callbackR = function(x) { print(as.numeric(x)+2) }
  #   callbackJS = "function(x) { print(as.numeric(x)+2)  { alert('Sum is ' + x); } }"
  #   
  #   
  # )
}

shinyApp(ui, server)