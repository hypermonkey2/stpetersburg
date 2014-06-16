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

datasetInput2<- reactive({

min<-min(as.numeric(StPetersburg(input$n)))

})

datasetInput3<- reactive({

max<-max(as.numeric(StPetersburg(input$n)))

})


	output$text1<- renderText({
	paste("The average pot was ",datasetInput1())
	})

	output$text2<- renderText({

	paste("The minumum pot was ",datasetInput2())
	
	})

	output$text3<- renderText({

	paste("The maximum pot was ",datasetInput3())
	})
    


})