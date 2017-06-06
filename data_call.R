data_call = function(){
  set.seed(123)
  data_variance = 0.9
  age_10 = data_generator(-0.8,13,0,2.5,50,data_variance)
  age_20 = data_generator(-0.8,15,1,3,50,data_variance)
  age_30 = data_generator(-0.8,17,2,4.5,50,data_variance)
  age_40 = data_generator(-0.8,19.5,3.5,6,50,data_variance)
  age_50 = data_generator(-0.8,21,5.5,7,50,data_variance)
  
  df = data.frame(numeric(50*5),numeric(50*5), integer(50*5))
  
  for (i in 1:50){ 
    df[i,1] = age_10$x_val[i]
    df[i,2] = age_10$y_val[i]
    df[i,3] = '10'
  }
  
  for (i in 1:50){ 
    df[50+i,1] = age_20$x_val[i]
    df[50+i,2] = age_20$y_val[i]
    df[50+i,3] = '20'
  }
  
  for (i in 1:50){ 
    df[100+i,1] = age_30$x_val[i]
    df[100+i,2] = age_30$y_val[i]
    df[100+i,3] = '30'
  }
  
  for (i in 1:50){ 
    df[150+i,1] = age_40$x_val[i]
    df[150+i,2] = age_40$y_val[i]
    df[150+i,3] = '40'
  }
  
  for (i in 1:50){ 
    df[200+i,1] = age_50$x_val[i]
    df[200+i,2] = age_50$y_val[i]
    df[200+i,3] = '50'
  }
  
  colnames(df) = c('exercise','cholesterol','age')
  return(df)
}