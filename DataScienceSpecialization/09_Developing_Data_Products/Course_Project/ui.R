library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("The Normal Distribution"),

    # Sidebar with a slider input for mu and sd
    sidebarLayout(
        sidebarPanel(
            helpText("The shape of the Normal Distribution is determined 
                     by the mean (mu) and standard deviation (sd)."),
            sliderInput("mu","mu:",                
                        min= -5, max= 5, value=0, step=0.1),
            sliderInput("sd","sd:",  
                        min=0.1, max= 5, value=1),
            selectInput("col", "Color:", choices=c('Red','Orange','Green','Blue','Purple'))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
