#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI
shinyUI(fluidPage(
    titlePanel("Bivariate Normal Distribution Generator"),
  
  # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h4("The plot to the right shows 800 random points generated
               from a bivariate normal distribution, centered at the origin,
               and with a covariance matrix determined from the input sliders.
                Try adjusting the sliders to see their effects on the distribution!"),
            sliderInput("x","X Variance:",min = 0,max = 10,value = 5),
            sliderInput("y","Y Variance:",min = 0,max = 10,value = 5),
            sliderInput("cc","Correlation:",min = -1,max = 1,value = 0,step=0.1)
        ),
    
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot",height="600px",width="600px")
        )
  )
))