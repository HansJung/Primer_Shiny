source('data_generator.R')
source('data_call.R')
library(ggplot2)
library(ellipse)
library(shiny)



shinyServer(function(input, output) {

    df = reactive({
      data_call(input$slider_relationship, input$slider_num_patients)
    })
      
  
    whatselected = reactive({
      if (is.null(input$checkGroup)){
        0
      }
      else if (length(input$checkGroup) > 1){
        100
      }
      else{
        input$checkGroup
      }
    })

    output$scatter = renderPlot(
      if (whatselected() == 1){
        df = df()
        ggplot(df,aes(x=exercise,y=cholesterol)) + geom_point(aes(group=age, color=age)) + geom_abline(intercept = 12.2490, slope=0.5838, col="blue") + stat_ellipse(level=0.95) + theme(text = element_text(size=20))            + geom_smooth(data=df,aes(x=exercise,y=cholesterol, group=age),method="lm",se=FALSE, colour="grey") + stat_ellipse(data=df,aes(x=exercise,y=cholesterol, group=age),color="grey",level=0.95)
      }
      else if (whatselected()==2){
        df = df()
        ggplot(df,aes(x=exercise,y=cholesterol, color=age)) + geom_point(aes(group=age)) + geom_smooth(method="lm",se=FALSE) + stat_ellipse(level=0.95) + theme(text = element_text(size=20))                 + geom_abline(intercept = 12.2490, slope=0.5838, col="grey") + stat_ellipse(data=df,aes(x=exercise,y=cholesterol),color="grey",level=0.95)
      }
      else if (whatselected()==0){
        df = df()
        ggplot(df,aes(x=exercise,y=cholesterol)) + theme(text = element_text(size=20))
      }
      else if (whatselected()==100){
        df = df()
        ggplot(df,aes(x=exercise,y=cholesterol, color=age)) + geom_point(aes(group=age)) + geom_smooth(method="lm",se=FALSE) + stat_ellipse(level=0.95) + theme(text = element_text(size=20))                 + geom_abline(intercept = 12.2490, slope=0.5838, col="blue") + stat_ellipse(data=df,aes(x=exercise,y=cholesterol),color="black",level=0.95)
      }
    )
  })
