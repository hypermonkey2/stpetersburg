library(shiny)
library(ggplot2)


shinyUI(pageWithSidebar(

  headerPanel("St-Petersburg Paradox"),

  sidebarPanel(

    sliderInput('n', 'Number of Rounds Played', min=1, max=100000, value=5000,
                 step=500, round=0),

	sliderInput('bet', 'Amount Wagered Each Round', min=1, max=50, value=20,
                 step=1, round=0)


  ),

  mainPanel(
	textOutput('text0'),
	 textOutput('text11'),
    textOutput('text1'),
  
	 textOutput('text2'),
  
	 textOutput('text3'),
	plotOutput('plot')
		
  )
))