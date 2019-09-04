library(purrr)
# Calc Factrial with 4 diffrent way
# Examples;
# Factorial_loop(4) # [1] 24
# Factorial_reduce(4) # [1] 24
# Factorial_func(4) # [1] 24
# Factorial_mem(4)
# f # [1] 24

## Simple Loop 
Factorial_loop <-function(n){
    f <- 1
    for(i in n:1){ f <<- f*i }
    return(f)
}

## Reduce
Factorial_reduce <-function(n){
    reduce(n:1,function(x,y){x*y})
}

# Recursive
Factorial_func <-function(n){
    if(n<=1){
        return(1)
    }else{
        n*Factorial_func(n-1)
    }
}

## Memorization
Factorial_mem <-function(n){
    if(n<=1){
        f <<- 1
    }else{
        Factorial_mem(n-1)
        f <<- f*n
    }
}
