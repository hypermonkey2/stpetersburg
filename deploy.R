setwd("C:/Users/Jon/Dropbox/R/shiny/stpetersburg")


library(shiny)
library(shinyapps)

shinyapps::setAccountInfo(name='jonmosco', token='936B940799F26EBB9FB699B769777684', secret='MwgkbyPb2Y9/g6IK4xO9eGVQtALCBxxPPHBrJtMZ')


terminateApp("shiny")

runApp()

deployApp()


x<-5

xx<-plot(x)

hist(x)

print(xx)