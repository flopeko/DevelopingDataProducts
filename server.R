#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(wordcloud)
library(RColorBrewer)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # output$distPlot <- renderPlot({
  #   
  #   # generate bins based on input$bins from ui.R
  #   x    <- faithful[, 2] 
  #   bins <- seq(min(x), max(x), length.out = input$bins + 1)
  #   
  #   # draw the histogram with the specified number of bins
  #   hist(x, breaks = bins, col = 'darkgray', border = 'white')
        # language
        keywords<- read.csv("keywords.csv", header= TRUE)
        
        output$wcPlot<- renderPlot({
                pal<- brewer.pal(8, input$palette)
                lang<- if(input$language== 1){lang= 1} else {lang= 2}
                wordcloud(keywords[, lang], keywords$skill_grade, max.words = Inf, random.order= FALSE, scale= c(4, 0.3), colors=pal)
        })
  
})
