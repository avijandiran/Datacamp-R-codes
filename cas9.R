library(shiny)
library(scales)
library(ggplot2)

labData <- 
  read.table("MockNLData.csv", 
             header=TRUE, sep=",")

#convert '<10' and '<20' results
labData$ModResult <- labData$Result
levels(labData$ModResult)[levels(labData$ModResult)=="<10"] 
<- "0"
levels(labData$ModResult)[levels(labData$ModResult)=="<20"] 
<- "0"
#convert results to scientific notation
SciNotResult <- 
  formatC(as.numeric(as.character(labData$ModResult)), 
          format="e", digits=2)

ui <- fluidPage(
  headerPanel("Dilution History"), 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="client", label="Select Client 
Name", choices=levels(labData$Client.Name)
      ),
      selectInput(inputId="test", label="Select Test Code", 
                  choices=levels(labData$Analysis))
    ),
    mainPanel(
      plotOutput("line", hover="plot_hov"),
      verbatimTextOutput("info"))
  )
)

server <- function(input, output) {
  #selected client into data frame
  selDF <- reactive({labData[labData[,1]==input$client,]
  })
  
  #selected test code into data frame
  subsetDF <- reactive({selDF()[selDF()[,5]==input$test,]
  })
  
  #points to be plotted
  points <- 
    reactive({as.numeric(levels(subsetDF()$ModResult)) 
      [subsetDF()$ModResult]
    })
  
  #plot
  output$line <- renderPlot({
    qplot(seq_along(points()), points(), xlab ="Index", 
          ylab ="Result")
  })
  
  #hover information  
  output$info <- renderText({
    paste0("x=", input$plot_hov$x, "\ny=", 
           input$plot_hov$y)
  })
}

shinyApp(ui = ui, server = server)