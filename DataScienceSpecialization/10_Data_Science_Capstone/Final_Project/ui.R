library(shiny)
library(stringr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel('The Next Word'),
    
    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            textInput('text', 'Input Text:'),
            actionButton('clear','Clear Text ')
        ),
        
        # Show Outputs
        mainPanel(h4('Input Text and the Next Word Predicted'),br(),
            htmlOutput('word')
        )
    )
))
