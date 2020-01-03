library(shiny)
library(dplyr)

df = data.frame(continent = c(rep("North America", 4), rep("Asia", 4), rep("Europe", 4)),
                country = c(rep("USA", 2), rep("Canada", 2), rep("China", 2), rep("Vietnam", 2), 
                            rep("France", 2), rep("Denmark", 2)),
                city = c("New York", "LA", "Ontario", "Ottawa", "Beijing", "Shanghai", "Hanoi", 
                         "Ho Chi Minh City", "Paris", "Tours", "Copenhagen", "Aarhus"))

HierarchyDependentDropdown = function(inputNames, columnNames, df, input = input, session = getDefaultReactiveDomain()){
  
  # make the inputs into reactive values
  my_reactive <- reactiveValues()
  lapply(1:length(inputNames), function(i){
    observe({
      my_reactive[[inputNames[i]]] = input[[inputNames[i]]]
    })
  })
  
  for(i in 2:length(inputNames)){
    observe({
      
      gg = lapply(1:(i-1), function(x){
        if(!is.null(my_reactive[[inputNames[x]]])){ 
          paste0(columnNames[x], " %in% c('", paste(my_reactive[[inputNames[x]]], collapse = "','"), "')")
        }
      })
      
      where_str = unlist(gg)
      
      tmp = df
      
      if(!is.null(where_str)){
        where_str = paste(where_str, collapse = " & ")
        tmp = df %>% filter_(where_str)
      }
      
      tmp = tmp %>% 
        select(columnNames[[i]]) %>% 
        distinct_(columnNames[[i]]) %>% 
        arrange_(columnNames[[i]]) %>% 
        pull() %>% 
        as.character()
      updateSelectizeInput(session,
                           inputId = inputNames[i],
                           choices = c("All" = "", tmp))
    })
  }
}

shinyApp(
  ui = basicPage(
    selectizeInput(inputId = "selectcontinent", 
                   label = "Select Continent", 
                   choices = c('All' = "", df %>% distinct(continent) %>% pull() %>% as.character()), 
                   multiple = TRUE)
    ,selectizeInput(inputId = "selectcountry", 
                    label = "Select Country", 
                    choices = c('All' = "", df %>% distinct(country) %>% pull() %>% as.character()), 
                    multiple = TRUE)
    ,selectizeInput(inputId = "selectcity", 
                    label = "Select City", 
                    choices = c('All' = "", df %>% distinct(city) %>% pull() %>% as.character()), 
                    multiple = TRUE)
  ),
  server = function(input, output, session) {
    HierarchyDependentDropdown(inputNames = c("selectcontinent",
                                              "selectcountry",
                                              "selectcity"), 
                               columnNames = c('continent',
                                               'country',
                                               'city'), 
                               df = df, 
                               input = input)
  }
)