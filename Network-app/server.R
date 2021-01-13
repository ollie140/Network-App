#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$graphPlot <- renderPlot({

        # generate nodes based on input$nodes from ui.R
        x    <- faithful[, 2]
        nodes <- seq(min(x), max(x), length.out = input$nodes + 1)

        # draw the histogram with the specified number of nodes
        hist(x, breaks = nodes, col = 'darkgray', border = 'white')

    })

})
