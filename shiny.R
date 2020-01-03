ui <- fluidPage(
  
  titlePanel("Welcome"),

  sidebarLayout(
    sidebarPanel(
      helpText("Choose the dataset from below dropdown list"),
      
      selectInput("var",
                  label="choose any dataset",
                  choices = c("Iris",
                              "mtcars",
                              "Whole sale Customer Data"),
                  selected = "Iris"),
      
      sliderInput("range",
                  label="Range of interest", min=0,max=100,value=c(0,100)),
      
      actionButton("button","Next")
      
      
    ),
    
    mainPanel(
      textOutput("Selected_var"),
      plotOutput("hist"),
      
      
      verbatimTextOutput("text1"),
      
      plotOutput("histogram")
      
      
    )
  )
  
)

server <- function(input,output){
  
  output$hist <- renderPlot({
    
    plot(iris)
  })
  
  output$histogram <- renderPlot({
    
    hist(rnorm(100))
  })


output$selected_var <- renderText({ 
  
  "You have selected this"
})



}


shinyApp(ui = ui , server= server)





























