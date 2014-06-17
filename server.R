library(shiny)
library(ggplot2)

shinyServer(function(input, output) {




StPetersburg <- function(n) {
  ## Simulates the St. Petersburg paradox.

  sapply(1:n, function(i) {
    pot.amount <- 1
    while (TRUE) {
      if (sample(c("H","T"), 1) == "H") pot.amount <- pot.amount*2
      else break
    }
    return(pot.amount)
  })
}
	datasetInput1<- reactive({

result<-mean(as.numeric(StPetersburg(input$n)))

})

	datasetInput11<- reactive({

profit<-as.numeric((input$n*datasetInput1())-(input$bet*input$n))

})

datasetInput2<- reactive({

min<-min(as.numeric(StPetersburg(input$n)))

})

datasetInput3<- reactive({

max<-max(as.numeric(StPetersburg(input$n)))

})

	output$text0<- renderText({
	paste("Imagine a game where a coin is flipped until Tails comes up. 
	For each heads, the winner pot doubles. In this context, how much should each round cost? 
	The expected winnings are theoretically infinite, but most people would not pay very much money to play. Here's a simulation!")
	})

	output$text11<- renderText({
	paste("The player profit was ",datasetInput11())
	})

	output$text1<- renderText({
	paste("The average pot was ",datasetInput1())
	})

	output$text2<- renderText({

	paste("The minimum pot was ",datasetInput2())
	
	})

	output$text3<- renderText({

	paste("The maximum pot was ",datasetInput3())
	})
    


})