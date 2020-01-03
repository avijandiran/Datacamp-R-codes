library(shiny)
library(MASS)
library(dplyr)
library(ggplot2)


ui <- fluidPage(
  titlePanel("Rabbit dataset from MASS library"),
  
  
  
  fluidRow(
    column(4, selectInput("var", 
                          "Animal:",
                          unique(sort(Rabbit$Animal)))),
    column(4, uiOutput("selected_var")),
    column(4, uiOutput("selected_var1")),
    column(12, plotOutput("selected_var2", hover = "plot_hover")),
    column(12, verbatimTextOutput("info"))
    
  )
)


server <- function(input, output) {
  
  ###FILTER NEXT DROPDOWN MENU BASED ON PREVIOUS SELECTED BY USER
  
  dataset3 <- reactive({
    unique(Rabbit %>% filter(Animal == input$var) %>% select(Treatment))
  })
  
  output$selected_var <- renderUI({
    selectInput("var1", "Treatment:", c(dataset3()))
  })
  
  dataset4 <- reactive({
    Rabbit %>% filter(Animal == input$var) %>% filter(Treatment == input$var1) %>% select(Run)
  })
  
  output$selected_var1 <- renderUI({
    selectInput("var2", "Run:", c(dataset4()))
  })
  
  ####
  
  output$selected_var2 <- renderPlot({ 
    
    ggplot(Rabbit %>% filter(Animal == input$var) %>% filter(Treatment == input$var1) %>% filter(Run == input$var2), aes(x = BPchange, y = Dose)) + geom_point()
  })
  
  ###HOVER POINT USING nearPoints()
  
  output$info <- renderPrint({
    nearPoints(Rabbit %>% filter(Animal == input$var) %>% filter(Treatment == input$var1) %>% filter(Run == input$var2), input$plot_hover)
  })
  
}


shinyApp(ui = ui, server = server)