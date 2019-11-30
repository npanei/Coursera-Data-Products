#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(MASS)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x <- input$x
    y <- input$y
    cc <- input$cc
    covXY <- cc*sqrt(x)*sqrt(y)
    
    n <- mvrnorm(800,mu=c(0,0),Sigma=matrix(c(x,covXY,covXY,y),ncol=2))
    
    plot(n,xlim=c(-10,10),ylim=c(-10,10),xlab="X",ylab="Y")
    
  })
  
})