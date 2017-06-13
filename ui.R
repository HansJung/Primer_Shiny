library(shiny)

# Define UI for OLS demo application
shinyUI(pageWithSidebar(
  
  #  Application title
  headerPanel("Exercise-Cholesterol study"),
  
  sidebarPanel(
    checkboxGroupInput("checkGroup", 
                       label = h3("Select a trend"), 
                       choices = list("Aggregated Data" = 1, 
                                      "Segregated Data" = 2),
                       selected = 1),
    
    br(),
    sliderInput("slider_num_patients", label = h4("Number of patients per groups"),
                min = 1, max = 50, value = 30),
    
    br(),
    sliderInput("slider_relationship", label = h4("Relationship between Exercise and Cholesterol"),
                min = -2, max = -0.1, value = -0.8),
    

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
    # textOutput("txt")
  )
))
