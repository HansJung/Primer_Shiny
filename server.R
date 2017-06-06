source('data_generator.R')
source('data_call.R')
library(ggplot2)
library(ellipse)
library(shiny)

shinyServer(function(input, output) {
  df = data_call()
    mytype = reactive({
      input$type
    })

    output$scatter = renderPlot(
      if (mytype() == 'agg_data'){
          ggplot(df,aes(x=exercise,y=cholesterol)) + geom_point(aes(group=age, color=age)) + geom_abline(intercept = 12.2490, slope=0.5838, col="blue") + stat_ellipse(level=0.95)
      }
      else if(mytype()=='seg_data'){
          ggplot(df,aes(x=exercise,y=cholesterol, color=age)) + geom_point(aes(group=age)) + geom_smooth(method="lm",se=FALSE) + stat_ellipse(level=0.95)
      }
    )
  })
