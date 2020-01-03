library(shiny)
library(rhandsontable)

cmt<-function(term){
  if (is.data.frame(term)||is.matrix(term)||is.vector(term)||is.list(term)){
    print("term is data.frame, matrix, list, or vector")
    print(paste(deparse(substitute(term)),"->"))
    print(term)
  } else{
    print(paste(deparse(substitute(term)),"->",term))  
  }
  
}


ui <- fluidPage(headerPanel("CX Tracker - Data Engine"),
                
                fluidPage(
                  column(6,
                         
                         p(uiOutput("Table"))
                         
                  )))



server <- function(input, output, session) {
  
  
  
  op <- reactiveValues(data = NULL) #reactive output
  
  
  observe({
    print("observe Triggered")
    if (!is.null(input$hot)) {
      op$df <- hot_to_r(input$hot)
      
      newVal<-input$hot$changes$changes[[1]][[4]]
      row<-input$hot$changes$changes[[1]][[1]]+1
      col<-input$hot$changes$changes[[1]][[2]]+1
      
      op$row<-row
      op$col<-col
      
      if (col==1&&nchar(newVal>0)){
        
        dim<-paste("r",row,sep="")
        
        if (newVal=="BBB"){
          rspnss<-unique(op$lstB)
          op$select[dim]<-data.frame(rspnss)
        } else if (newVal=="CCC"){
          rspnss<-unique(op$lstC)
          op$select[dim]<-data.frame(rspnss)
        }
      }
    }
  })
  
  df<-reactive({
    print("df reactive Triggered")
    if (is.null(op$df)) {
      colA<-c("","","","")
      colB<-c("","","","")
      colC<-c("","","","")
      lstA<-c("BBB","CCC","BBB","CCC")
      lstB<-c("B1","B2","B3","B4")
      lstC<-c("C1","C2","C3","C4")
      
      op$df<-data.frame(colA=colA,colB=colB,colC=colC)
      op$lstA<-lstA
      op$lstB<-lstB
      op$lstC<-lstC
      df<-op$df
    } else{
      df<-op$df
    }
  })
  
  sourceLst<-reactive({
    print("sourceLst Triggered")
    r<-input$hot_select$select$r
    newVal<-input$hot$changes$changes[[1]][[4]]
    row<-input$hot$changes$changes[[1]][[1]]+1
    col<-input$hot$changes$changes[[1]][[2]]+1
    cmt(r)
    cmt(newVal)
    cmt(row)
    cmt(col)
    
    if((!is.null(op$row))&&(!is.null(r))&&(r==op$row)){
      dim<-paste("r",r,sep="")
      
      if (col==1&&nchar(newVal>0)){
        if (newVal=="BBB"){
          rspnss<-unique(op$lstB)
          op$select[dim]<-data.frame(rspnss)
        } else if (newVal=="CCC"){
          rspnss<-unique(op$lstC)
          op$select[dim]<-data.frame(rspnss)
        }
      }
      list<-as.list(op$select[dim])
      source<-list
      return(source)
    } else {
      source<-as.list(c("default",Sys.time()))
      return(source)
    }
    
  })
  
  output$Table <- renderUI({
    
    output$hot<-renderRHandsontable({ 
      rhandsontable(df(),selectCallback=TRUE,readOnly=FALSE,useTypes = TRUE,width = 500) %>%
        hot_context_menu(allowRowEdit = TRUE, allowColEdit = FALSE) %>%
        hot_col(col = "colA", type = "dropdown", source = op$lstA) %>%
        hot_col(col = "colB", type = "dropdown", source = sourceLst(), strict=FALSE) %>%
        hot_col(col = "colC", type = "dropdown", source = sourceLst(), strict=FALSE)
    })
    rHandsontableOutput('hot')
    
  })
}

shinyApp(ui = ui, server = server)