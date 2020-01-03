# library(shiny)
# library(shinyjs)
# library(shinyalert)
# 
# ui <- fluidPage(
#   shinyjs::useShinyjs(),
#   useShinyalert(),
#   actionButton("run", "Run", class = "btn-success")
# )
# server <- function(input, output, session) {
#   shinyEnv <- environment()
#   
#   observeEvent(input$run, {
#     
#     shinyalert('hello', type='input')
#   })
# }
# shinyApp(ui = ui, server = server)

# ui <- fluidPage(
#   shinyjs::useShinyjs(),
#   actionButton("run", "Run", class = "btn-success"),
#   textOutput("output1")
# )
# server <- function(input, output, session) {
#   
#   dataModal <- function(failed = FALSE) {
#     modalDialog(
#       textInput("input1", "Enter text:",
#                 placeholder = 'Enter text here'
#       )
#     )
#   }
#   
#   # Show modal when button is clicked.
#   observeEvent(input$run, {
#     showModal(dataModal())
#   })
#   
#   output$output1 <- renderText({
#     input$input1
#   })
# }
# shinyApp(ui = ui, server = server)


library(shiny)
library(shinyalert)

ui <- fluidPage(
  useShinyalert(),
  actionButton("go", "go")
)

server <- function(input, output, session) {
  observeEvent(input$go, {
    shinyalert("box1", type = "input", inputid = "foo")
  })
  
  observeEvent(input$foo, {
    Sys.sleep(0.5)
    print("here")
    shinyalert("box2")
  })
}

shinyApp(ui, server)