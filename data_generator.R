data_generator = function(slope_val, intercept_val, from_val, to_val,len_val, noise_var){
    x = seq(from=from_val, to=to_val, length.out=len_val) 
    y = slope_val * x + intercept_val 
    y = y + rnorm(length(y),0,noise_var)
    return(list(x_val = x, y_val = y))
}