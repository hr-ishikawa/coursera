## Create Shiny App Predict Next Word form ngram

### Usage

https://hr-ishikawa.shinyapps.io/Shiny_predict_next_word/

### Shiny Source

#### ui.R

```{r}
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
```

#### server.R

```{r}
library(shiny)
library(dplyr)
library(readr)
library(stringr)
library(tidytext)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    parse_in_text <- function(lines){ 
        # Convert lines to Dataframe with Eond of Sentense Mark 
        tibble(line=lines) %>%        # [1] 4,269,678
            unnest_tokens(word,line) %>%
            filter(str_detect(word,'^[a-zA-Z]')) %>%
#            anti_join(stop_words) %>%
            mutate(word=str_replace(word,'\'s$','')) %>% 
            group_by(word) %>% mutate(n=n()) %>% ungroup() %>% 
            mutate(next_word=lead(word,default='')) %>%
            select(word)
    }
    
    next_word <-function(ngram,in_text){
        in_words <- parse_in_text(in_text) %>% pull(word)
        if(length(in_words)<1){return('[[Not Predicted]]')}
        nr <- length(in_words)
        in_W3 <- if(nr>=3){in_words[nr-2]}else{''}
        in_W2 <- if(nr>=2){in_words[nr-1]}else{''}
        in_W1 <- in_words[nr]
        next_word3 <- ngram %>% filter(W1==in_W1,W2==in_W2,W3==in_W3) %>% pull(next_word)
        next_word2 <- ngram %>% filter(W1==in_W1,W2==in_W2,W3==''   ) %>% pull(next_word)
        next_word1 <- ngram %>% filter(W1==in_W1,W2==''   ,W3==''   ) %>% pull(next_word)
        if(length(next_word3)>0){return(next_word3)}
        if(length(next_word2)>0){return(next_word2)}
        if(length(next_word1)>0){return(next_word1)}
        return('[[Not Predicted]]')
    }
    
    # load ngrem
    df <- reactive({ read_tsv(str_c('ngram.tsv'),na=c('NA'),col_names=T,col_types='cccc') })

    observeEvent(input$clear, {
        ## Clear Text
        updateTextInput(session, 'text',value='')
    })

    output$word <- renderText({
        ngram <- df()
        # get input test
        in_text <- input$text

        if(str_length(in_text)<1){
            out_html <- '"" ->> '
        }else{
            out_html <- str_c('<font color="blue">',in_text,                 '</font>" ->> ',
                              '<font color="red" >',next_word(ngram,in_text),'</font>'       )
        }
        # Return
        str_c('<div style="border:2px solid gray;"><div style="margin-left:5px;"><h4><b>"',
              out_html,'
              </b></h4></div></div>',sep='')
    })
    
})
```
