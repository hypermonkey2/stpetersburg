library(shiny)
library(ggplot2)


shinyUI(pageWithSidebar(

  headerPanel("St-Petersburg Paradox"),

  sidebarPanel(

    sliderInput('n', 'Number of Trials', min=1, max=100000, value=5000,
                 step=500, round=0)
  ),

  mainPanel(
    textOutput('text1'),
  
	 textOutput('text2'),
  
	 textOutput('text3')
		
  )
))