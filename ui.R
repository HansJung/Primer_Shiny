library(shiny)

# Define UI for OLS demo application
shinyUI(pageWithSidebar(
  
  #  Application title
  headerPanel("Exercise-Cholesterol study"),
  
  sidebarPanel(
    
    radioButtons("type", "Select a trend:",
                 list("Aggregated Data" = "agg_data",
                      "Segregated Data" = "seg_data"
                      )),
    br(),
    

    helpText(
      h3("Aggregated Data:",style="color:blue"),
      p("If we consider the data without considering age group, we see a upward trend; the more a person exercise, the higher their cholesterol is. This interpretation doesn't make sense."),
      h3("Segregated Data:",style="color:red"),
      p("If we consider the segregated data by age, we can see that there is a downward trend in each group; the more a person exercise, the lower their cholesterol is.")
    ),
    br()
    
    ),
  
  
  
  # Show the main display
  mainPanel(
    plotOutput("scatter"),
    br()
  )
))
