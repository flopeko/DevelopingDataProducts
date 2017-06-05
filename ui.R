#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(" Wordcloud of my Data Science Skills"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h4("Select Language & favourite Palette", align = "left"),
       # sliderInput("bins",
       #             "Number of bins:",
       #             min = 1,
       #             max = 50,
       #             value = 30),
       selectInput("language", label = h3("Select Language:"), 
                   choices = list("Español" = 1, "English" = 2), selected = 1),
       selectInput("palette", label = h3("Select Palette:"), 
                   choices = list("Dark" = "Dark2", "Purples" = "Purples", "Greys"= "Greys", "Yellow & Green"= "YlGn"), selected = "YlGn")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h4("The app is really simple, just select a Language and the color Palette and it will give back a Wordcloud of my Data Science Skills. Spanish language & Yellow & Green palette are defaults.", align = "left"),
       plotOutput("wcPlot")
    )
  )
))
