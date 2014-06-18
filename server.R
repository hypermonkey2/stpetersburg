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

#dataset
	dataset<-reactive({
	StPetersburg(input$n)

})

#dataset with total cumulative profit
	dataset1<-reactive({

	set<-dataset()

	#set of cumulative winnings
	wset<-numeric(input$n)

	for(i in 1:input$n){
		if (i==1) {wset[i]=set[1]}
		if (i>1) { wset[i]<-set[i]+wset[i-1]}

	}

#set of cumulative spent

	bset<-numeric(input$n)

	for(i in 1:input$n){

		bset[i]<-i*(input$bet)
	}

#cumulative profit set
	pset<-wset-bset
	return(pset)


})



	datasetInput1<- reactive({

result<-mean(as.numeric(dataset()))

})

	datasetInput11<- reactive({

profit<-as.numeric((input$n*datasetInput1())-(input$bet*input$n))

})

datasetInput2<- reactive({

min<-min(as.numeric(dataset()))

})

datasetInput3<- reactive({

max<-max(as.numeric(dataset()))

})

datasetInput4<- reactive({

max<-min(as.numeric(dataset1()))

})

datasetInput5<- reactive({

max<-max(as.numeric(dataset1()))

})



	output$text00<- renderText({
	paste("The minumum profit was ",datasetInput4())
	})
	output$text01<- renderText({
	paste("The maximum profit was ",datasetInput5())
	})



	output$text0<- renderText({
	paste("Imagine a game where a coin is flipped until Tails comes up. 
	For each heads, the prize doubles. So if we start with a prize of 1$ and get three heads in a row, we win 4$ (or 1*2*2). 
	So, what's a fair price to play a round of this game?
	The expected winnings are theoretically infinite (game with infinite mathematical expectation), but this seems weird and most people would not pay very much money to play. 
	What's going on? 
	Create a simulation based on the slider inputs on the left.")
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
    
 

output$plot <- renderPlot(function() {

    #p <- 
	plot(dataset(),xlab="Trial number",ylab="Trial Pot Value")
    #print(p)

  })

#plot of total profit
output$plot1 <- renderPlot(function() {

    #p <- 
	plot(dataset1(),xlab="Trial number",ylab="Cumulative Profit")
	abline(h=0,col=2,lty=1)
    #print(p)

  })


})




