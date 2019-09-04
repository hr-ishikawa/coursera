# OOP Code for MIE
library(readr)
library(magrittr)
library(dplyr)
library(tidyr)


# Methods

# Constructor
make_LD <- function(data){
  structure(list(df=as.data.frame(data), s=NaN, v=NaN, r=''), class='LongitudinalData')
}

# Define functions as Generic
subject <- function(x, s){ UseMethod('subject') }
visit   <- function(x, v){ UseMethod('visit') }
room    <- function(x, r){ UseMethod('room') }

# Functions as Method
subject.LongitudinalData <- function(x, s){
  if(s %in% unique(x$df$id)){
      structure(list(df=x$df[x$df$id==s,], s=s, v=x$v, r=x$r), class='LongitudinalData')
   }else{
       NULL
   }
}
visit.LongitudinalData <- function(x, v){
    structure(list(df=x$df[x$df$visit==v,], s=x$s, v=v, r=x$r), class='LongitudinalData')
}
room.LongitudinalData <- function(x, r){
    structure(list(df=x$df[x$df$room==r,], s=x$s, v=x$v, r=r),  class='LongitudinalData')
}

# Summary function
summary.LongitudinalData <- function(x){
   if(is.nan(x$s) || is.nan(x$v) || x$r=='' ){
       wdf <- x$df %>%
              group_by(visit,room) %>%
              summarize(value=mean(value)) %>%
              spread(key=room, value=value) %>%
              as.data.frame() 
       structure(list(df=wdf, s=x$s, v=x$v, r=x$r), class='LongitudinalData.summary')
   }else{
       wdf <- x$df$value %>% summary()
       structure(list(df=wdf, s=x$s, v=x$v, r=x$r), class='LongitudinalData.summary')
   }
}

# Print Funtion
print.LongitudinalData <- function(x){
    if(      is.nan(x$s) ){
        print( paste('Longitudinal dataset with',length(unique(x$df$id)),'subjects'), quote=F )
    }else if(is.nan(x$v) && x$r=='' ){
            print( paste('Subject ID:', x$s ), quote=F )
    }else{
        if(!is.nan(x$s)){ print( paste('ID:',    x$s ), quote=F ) }
        if(!is.nan(x$v)){ print( paste('Visit:', x$v ), quote=F ) }
        if(x$r!=''     ){ print( paste('Room:',  x$r ), quote=F ) }
    }
}

# Print Funtion for summary
print.LongitudinalData.summary <- function(x){
    print( paste('ID:', x$s ), quote=F )
    print( x$df )
}
