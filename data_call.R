data_call = function(par_slope, n_data_group){
  set.seed(1)
  data_variance = 0.5
  
  age_10 = data_generator(par_slope,-par_slope * 16.25,0,2.5,n_data_group ,data_variance)
  age_20 = data_generator(par_slope,-par_slope * 16.25 + 2,1,3,n_data_group ,data_variance)
  age_30 = data_generator(par_slope,-par_slope * 16.25 + 4,2,4.5,n_data_group ,data_variance)
  age_40 = data_generator(par_slope,-par_slope * 16.25 + 6,3.5,6,n_data_group ,data_variance)
  age_50 = data_generator(par_slope,-par_slope * 16.25 + 8,5.5,7,n_data_group ,data_variance)
  
  df = data.frame(numeric(n_data_group *5),numeric(n_data_group *5), integer(n_data_group *5))
  
  for (i in 1:n_data_group ){ 
    df[i,1] = age_10$x_val[i]
    df[i,2] = age_10$y_val[i]
    df[i,3] = '10'
  }
  
  for (i in 1:n_data_group ){ 
    df[n_data_group +i,1] = age_20$x_val[i]
    df[n_data_group +i,2] = age_20$y_val[i]
    df[n_data_group +i,3] = '20'
  }
  
  for (i in 1:n_data_group){ 
    df[n_data_group * 2+i,1] = age_30$x_val[i]
    df[n_data_group * 2+i,2] = age_30$y_val[i]
    df[n_data_group * 2+i,3] = '30'
  }
  
  for (i in 1:n_data_group){ 
    df[n_data_group * 3 + i,1] = age_40$x_val[i]
    df[n_data_group * 3 + i,2] = age_40$y_val[i]
    df[n_data_group * 3 + i,3] = '40'
  }
  
  for (i in 1:n_data_group){ 
    df[n_data_group * 4 +i,1] = age_50$x_val[i]
    df[n_data_group * 4 +i,2] = age_50$y_val[i]
    df[n_data_group * 4 +i,3] = '50'
  }
  
  colnames(df) = c('exercise','cholesterol','age')
  return(df)
}