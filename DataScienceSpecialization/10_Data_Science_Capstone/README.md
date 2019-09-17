Course Tasks
This course will be separated into 8 different tasks that cover the range of activities encountered by a practicing data scientist. They mirror many of the skills you have developed in the data science specialization. The tasks are:

- Understanding the problem
- Data acquisition and cleaning
- Exploratory analysis
- Statistical modeling
- Predictive modeling
- Creative exploration
- Creating a data product
- Creating a short slide deck pitching your product

You will hear about each of these tasks over the course of the capstone.

## Week 1

he first step in analyzing any new data set is figuring out: 
(a) what data you have  
(b) what are the standard tools and models used for that type of data  
Make sure you have downloaded the data from Coursera before heading for the exercises. This exercise uses the files named LOCALE.blogs.txt where LOCALE is the each of the four locales en_US, de_DE, ru_RU and fi_FI. The data is from a corpus called HC Corpora. See the About the Corpora reading for more details. The files have been language filtered but may still contain some foreign text.

In this capstone we will be applying data science in the area of natural language processing. As a first step toward working on this project, you should familiarize yourself with Natural Language Processing, Text Mining, and the associated tools in R. Here are some resources that may be helpful to you.

- Natural language processing Wikipedia page https://en.wikipedia.org/wiki/Natural_language_processing
- Text mining infrastucture in R http://www.jstatsoft.org/v25/i05/
- CRAN Task View: Natural Language Processing http://cran.r-project.org/web/views/NaturalLanguageProcessing.html
- Coursera course on NLP (not in R) https://www.coursera.org/course/nlp

#### Dataset

This is the training data to get you started that will be the basis for most of the capstone. You must download the data from the Coursera site and not from external websites to start.

- Capstone Dataset https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip


### Task 1: Getting and cleaning the data

#### Tasks to accomplish

1. Tokenization - identifying appropriate tokens such as words, punctuation, and numbers. Writing a function that takes a file as input and returns a tokenized version of it.
2. Profanity filtering - removing profanity and other words you do not want to predict.


### About the Copora

The corpora are collected from publicly available sources by a web crawler. The crawler checks for language, so as to mainly get texts consisting of the desired language*.

Each entry is tagged with it's date of publication. Where user comments are included they will be tagged with the date of the main entry.

Each entry is tagged with the type of entry, based on the type of website it is collected from (e.g. newspaper or personal blog) If possible, each entry is tagged with one or more subjects based on the title or keywords of the entry (e.g. if the entry comes from the sports section of a newspaper it will be tagged with "sports" subject).In many cases it's not feasible to tag the entries (for example, it's not really practical to tag each individual Twitter entry, though I've got some ideas which might be implemented in the future) or no subject is found by the automated process, in which case the entry is tagged with a '0'.

To save space, the subject and type is given as a numerical code.

Once the raw corpus has been collected, it is parsed further, to remove duplicate entries and split into individual lines. Approximately 50% of each entry is then deleted. Since you cannot fully recreate any entries, the entries are anonymised and this is a non-profit venture I believe that it would fall under Fair Use.



Your original exploration of the data and modeling steps will be performed on this data set. Later in the capstone, if you find additional data sets that may be useful for building your model you may use them.

#### Tasks to accomplish

1. Obtaining the data - Can you download the data and load/manipulate it in R?
2. Familiarizing yourself with NLP and text mining - Learn about the basics of natural language processing and how it relates to the data science process you have learned in the Data Science Specialization.

#### Questions to consider

1. What do the data look like?
2. Where do the data come from?
3. Can you think of any other data sources that might help you in this project?
4. What are the common steps in natural language processing?
5. What are some common issues in the analysis of text data?
6. What is the relationship between NLP and the concepts you have learned in the Specialization?

### About the Copora

The corpora are collected from publicly available sources by a web crawler. The crawler checks for language, so as to mainly get texts consisting of the desired language.

Each entry is tagged with it's date of publication. Where user comments are included they will be tagged with the date of the main entry.

Each entry is tagged with the type of entry, based on the type of website it is collected from (e.g. newspaper or personal blog) If possible, each entry is tagged with one or more subjects based on the title or keywords of the entry (e.g. if the entry comes from the sports section of a newspaper it will be tagged with "sports" subject).In many cases it's not feasible to tag the entries (for example, it's not really practical to tag each individual Twitter entry, though I've got some ideas which might be implemented in the future) or no subject is found by the automated process, in which case the entry is tagged with a '0'.

To save space, the subject and type is given as a numerical code.

Once the raw corpus has been collected, it is parsed further, to remove duplicate entries and split into individual lines. Approximately 50% of each entry is then deleted. Since you cannot fully recreate any entries, the entries are anonymised and this is a non-profit venture I believe that it would fall under Fair Use.


## Week 2

### Task2: Exploratory Data Analysis

The first step in building a predictive model for text is understanding the distribution and relationship between the words, tokens, and phrases in the text. The goal of this task is to understand the basic relationships you observe in the data and prepare to build your first linguistic models.

#### Tasks to accomplish

1. Exploratory analysis - perform a thorough exploratory analysis of the data, understanding the distribution of words and relationship between the words in the corpora.
2. Understand frequencies of words and word pairs - build figures and tables to understand variation in the frequencies of words and word pairs in the data.

#### Questions to consider

1. Some words are more frequent than others - what are the distributions of word frequencies?
2. What are the frequencies of 2-grams and 3-grams in the dataset?
3. How many unique words do you need in a frequency sorted dictionary to cover 50% of all word instances in the language? 90%?
4. How do you evaluate how many of the words come from foreign languages?
5. Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller number of words in the dictionary to cover the same number of phrases?

### Task 3: Modeling

The goal here is to build your first simple model for the relationship between words. This is the first step in building a predictive text mining application. You will explore simple models and discover more complicated modeling techniques.

#### Tasks to accomplish

1. Build basic n-gram model - using the exploratory analysis you performed, build a basic n-gram model for predicting the next word based on the previous 1, 2, or 3 words.
2. Build a model to handle unseen n-grams - in some cases people will want to type a combination of words that does not appear in the corpora. Build a model to handle cases where a particular n-gram isn't observed.

#### Questions to consider

1. How can you efficiently store an n-gram model (think Markov Chains)?
2. How can you use the knowledge about word frequencies to make your model smaller and more efficient?
3. How many parameters do you need (i.e. how big is n in your n-gram model)?
4. Can you think of simple ways to "smooth" the probabilities (think about giving all n-grams a non-zero probability even if they aren't observed in the data) ?
5. How do you evaluate whether your model is any good?
6. How can you use backoff models to estimate the probability of unobserved n-grams?

#### Hints, tips, and tricks

As you develop your prediction model, two key aspects that you will have to keep in mind are the size and runtime of the algorithm. These are defined as:

1. Size: the amount of memory (physical RAM) required to run the model in R
2. Runtime: The amount of time the algorithm takes to make a prediction given the acceptable input
Your goal for this prediction model is to minimize both the size and runtime of the model in order to provide a reasonable experience to the user.

Keep in mind that currently available predictive text models can run on mobile phones, which typically have limited memory and processing power compared to desktop computers. Therefore, you should consider very carefully (1) how much memory is being used by the objects in your workspace; and (2) how much time it is taking to run your model. Ultimately, your model will need to run in a Shiny app that runs on the shinyapps.io server.

#### Tips, tricks, and hints

Here are a few tools that may be of use to you as you work on their algorithm:

- object.size(): this function reports the number of bytes that an R object occupies in memory
- Rprof(): this function runs the profiler in R that can be used to determine where bottlenecks in your function may exist. The profr package (available on CRAN) provides some additional tools for visualizing and summarizing profiling data.
- gc(): this function runs the garbage collector to retrieve unused RAM for R. In the process it tells you how much memory is currently being used by R.

There will likely be a tradeoff that you have to make in between size and runtime. For example, an algorithm that requires a lot of memory, may run faster, while a slower algorithm may require less memory. You will have to find the right balance between the two in order to provide a good experience to the user.

## Week 3

### Task 4: Prediction Model

The goal of this exercise is to build and evaluate your first predictive model. You will use the n-gram and backoff models you built in previous tasks to build and evaluate your predictive model. The goal is to make the model efficient and accurate.

#### Tasks to accomplish

1. Build a predictive model based on the previous data modeling steps - you may combine the models in any way you think is appropriate.
2. Evaluate the model for efficiency and accuracy - use timing software to evaluate the computational complexity of your model. Evaluate the model accuracy using different metrics like perplexity, accuracy at the first word, second word, and third word.

#### Questions to consider

1. How does the model perform for different choices of the parameters and size of the model?
2. How much does the model slow down for the performance you gain?
3. Does perplexity correlate with the other measures of accuracy?
4. Can you reduce the size of the model (number of parameters) without reducing performance?

## Week 4

### Task 5: Creative Exploration

So far you have used basic models to understand and predict words. In this next task, your goal is to use all the resources you have available to you (from the Data Science Specialization, resources on the web, or your own creativity) to improve the predictive accuracy while reducing computational runtime and model complexity (if you can). Be sure to hold out a test set to evaluate the new, more creative models you are building.

#### Tasks to accomplish

1. Explore new models and data to improve your predictive model.
2. Evaluate your new predictions on both accuracy and efficiency.

#### Questions to consider

1. What are some alternative data sets you could consider using?
2. What are ways in which the n-gram model may be inefficient?
3. What are the most commonly missed n-grams? Can you think of a reason why they would be missed and fix that?
4. What are some other things that other people have tried to improve their model?
5. Can you estimate how uncertain you are about the words you are predicting?

## Week 5

### Task 6: Data Prodact

The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others via a Shiny app..

#### Tasks to accomplish

1. Create a data product to show off your prediction algorithm You should create a Shiny app that accepts an n-gram and predicts the next word.

#### Questions to consider

1. What are the most interesting ways you could show off your algorithm?
2. there any data visualizations you think might be helpful (look at the Swiftkey data dashboard if you have it loaded on your phone)?
3. How should you document the use of your data product (separately from how you created it) so that others can rapidly deploy your algorithm?

#### Tips, tricks, and hints

1. Consider the size of the predictive model you have developed. You may have to sacrifice some accuracy to have a fast enough/small enough model to load into Shiny.






