library(shiny)
library(ggplot2)
library(stringr)
library(tibble)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        colors <-tibble( col =c('Red',  'Orange',   'Green',    'Blue',     'Purple'   ),
                         col1=c('pink', 'orange',   'limegreen','lightblue','plum'     ),
                         col2=c('red',  'orangered','darkgreen','blue',     'violetred') )

                # generate bins based on input$bins from ui.R
        mu <- input$mu
        sd <- input$sd
        
        x       <- seq(-10, 10, length=100)
        density <- dnorm(x, mu, sd)

        col1 <- colors %>% filter(col==input$col) %>% nth(2)
        col2 <- colors %>% filter(col==input$col) %>% nth(3)
        
        ggplot()+ggtitle(str_c('Normal Distribution; mu=',mu,', sd=',sd))+
            geom_ribbon(aes(x=x, ymin=0, ymax=density), fill=col1)+
            geom_line(  aes(x=x, y=density),            color=col2, size=2)+
            geom_text(  aes(x=mu+(last(x)-mu)/10, y=dnorm(mu,mu,sd)/10), 
                        label=str_c('mu=',mu), color=col2, size=5)+
            geom_vline(xintercept=mu, color=col2,    size=1)+
            geom_hline(yintercept=0,  color='black', size=1)
        
    })

})
