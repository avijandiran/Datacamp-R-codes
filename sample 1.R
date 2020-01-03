library(shiny)
library(shinydashboard)
# Fields definition -------------------------------------------------------
fields <- c("name", # the order here will be the same as the one that is saved in a CSV! 
            "title_reference",
            "year_publication",
            "first_author",
            "journal",
            "Species",
            "used_shiny",
            "favourite_pkg", 
            "os_type", 
            "r_num_years")

# Mandatory fields --------------------------------------------------------
fieldsMandatory <- c("name", 
                     "favourite_pkg")
# Labeling with star for mandatory fields
labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

# Design ------------------------------------------------------------------
appCSS <- 
  ".mandatory_star { color: red; }
#error { color: red; }"

# To save the Data  -------------------------------------------------------
library(rdrop2) 
# This  is a folder that is going to be created on Dropbox 
outputDir <- "responses"

epochTime <- function() {
  as.integer(Sys.time())
}

humanTime <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}

saveData <- function(data) {
  data = c(data, timestamp = epochTime())
  data <- t(data)
  # Create a unique file name
  fileName <- sprintf("evo_rates_form_%s_%s.csv", 
                      humanTime(), 
                      digest::digest(data))
  # Write the data to a temporary file locally
  filePath <- file.path(tempdir(), 
                        fileName)
  write.csv(data, 
            filePath, 
            row.names = FALSE, 
            quote = TRUE)
  
  # Upload the file to Dropbox
  drop_upload(filePath, 
              dest = outputDir)
}

loadData <- function() {
  # Read all the files into a list
  filesInfo <- drop_dir(outputDir)
  filePaths <- filesInfo$path
  data <- lapply(filePaths, drop_read_csv, stringsAsFactors = FALSE)
  # Concatenate all data together into one data.frame
  data <- do.call(rbind, data)
  data
}


# ShinyAPP ----------------------------------------------------------------
# Shiny app with 3 fields that the user can submit data for
shinyApp(
  ui <- dashboardPage(skin = "green",
                     dashboardHeader(title = "Evolutionary Rates Data Collection", titleWidth = 350),
                     dashboardSidebar(#disable = TRUE,
                       width = 250,
                       sidebarMenu(menuItem("Menu Item"),
                                   menuItem("Form", tabName = "form_tab", icon = icon("file-text")),
                                   menuItem("Help", tabName = "help_tab", icon = icon("question"))
                       )
                     ),
                     dashboardBody(
                       
                       shinyjs::useShinyjs(), 
                       shinyjs::inlineCSS(appCSS), # you need this if you want to change the "design" of you form
                       # titlePanel("Evolutionary Rates Form"),
                       
                       # DataTables
                       DT::dataTableOutput("responses", # this will customize the table
                                           width = 300), 
                       # tags$hr(), # This is adding a horizontal rule (line)
                       
                       # Form inputs -------------------------------------------------------------
                       tabItems(
                         # First tab content
                         tabItem(tabName = "form_tab",
                                 h2("Main form"),
                                 
                                 div(
                                   id = "form",
                                   ## text input 
                                   textInput("name", 
                                             labelMandatory("Name (First and last name)"), ""),
                                   textInput("favourite_pkg", 
                                             labelMandatory("Favourite R package")),
                                   textInput("title_reference",
                                             "Title of the reference"),
                                   textInput("year_publication",
                                             "Year of publication"),
                                   textInput("first_author",
                                             "First author"),
                                   textInput("journal",
                                             "Journal"),
                                   textInput("Species","Species"),
                                   
                                   ## Checkbox input 
                                   checkboxInput("used_shiny", 
                                                 "I've built a Shiny app in R before", 
                                                 FALSE),
                                   ## Slider input 
                                   sliderInput("r_num_years", 
                                               "Number of years using R",
                                               0, 25, 2, ticks = FALSE),
                                   
                                   ## Dropdown menu input 
                                   selectInput("os_type", 
                                               "Operating system used most frequently",
                                               c("",  "Windows", "Mac", "Linux")),
                                   
                                   ## Action button 
                                   actionButton("submit", 
                                                "Submit"),
                                   
                                   # Submission progression bar or Error
                                   shinyjs::hidden(
                                     span(id = "submit_msg", 
                                          "Submitting..."),
                                     div(id = "error",
                                         div(br(), 
                                             tags$b("Error: "), # b tags is for bold text 
                                             span(id = "error_msg"))
                                     ) # Closing div
                                   ) # Closing shinyjs::hidden
                                   
                                 ) # Closing div
                         ), # closing tab 1 
                         
                         # Second tab content
                         tabItem(tabName = "help_tab",
                                 h2("Want some help or information?"))
                       ), # Closing tabItems
                       
                       # Thank you message -------------------------------------------------------    
                       shinyjs::hidden(
                         div(
                           id = "thankyou_msg",
                           h2("Thanks, your response was submitted successfully!"),
                           actionLink("submit_another", 
                                      "Submit another response")
                         ) # Closing div 
                       ) # Closing shinyjs::hidden
                       
                     ) # Closing DashboardBody
  ), # Closing DashboardPage
  
  # Server ------------------------------------------------------------------
  
  
  server <- function(input, output, session) {
    
    # Whenever a field is filled, aggregate all from data
    formData <- reactive({
      data <- sapply(fields, function(x) input[[x]])
      data
    })
    
    observe({
      # check if all mandatory fields have a value
      mandatoryFilled <-
        vapply(fieldsMandatory,
               function(x) {
                 !is.null(input[[x]]) && input[[x]] != ""
               },
               logical(1))
      mandatoryFilled <- all(mandatoryFilled)
      
      # enable/disable the submit button
      shinyjs::toggleState(id = "submit", 
                           condition = mandatoryFilled)
    })
    
    # When the Submit button is clicked, save the form data (action to take when submit button is pressed)
    observeEvent(input$submit, {
      shinyjs::disable("submit")
      shinyjs::show("submit_msg")
      shinyjs::hide("error")
      
      tryCatch({
        saveData(formData())
        shinyjs::reset("form")
        shinyjs::hide("form")
        shinyjs::show("thankyou_msg")
      },
      error = function(err) {
        shinyjs::text("error_msg", err$message)
        shinyjs::show(id = "error", anim = TRUE, animType = "fade")
      },
      finally = {
        shinyjs::enable("submit")
        shinyjs::hide("submit_msg")
      })
    })
    
    # Hide the thank you message and show the form 
    observeEvent(input$submit_another, {
      shinyjs::show("form")
      shinyjs::hide("thankyou_msg")
    })    
    
  }
)


shinyApp(ui, server)
