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

    output$graphPlot <- renderVisNetwork({

        # generate nodes based on input$nodes from ui.R
        x  <- erdos.renyi.game(input$nodes, input$edges, type = "gnm")

        # draw the network with the specified number of nodes
        #plot(x, vertex.label= NA, edge.arrow.size= 0.02, vertex.size = 0.5, xlab = "Random Network: G(N,L) model")
        visIgraph(x)

    })

})
