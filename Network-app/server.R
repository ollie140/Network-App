#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    jqui_resizable(
        ui = "#graphPlotDiv",
        options = list(
            minHeight = 300,
            maxHeight = "100%",
            minWidth = 300,
            maxWidth = "100%"
        )
    )
    
    observeEvent(input$toggle, {
        jqui_toggle('#graphPlotDiv', effect = "blind")
    })
    
    observeEvent(input$updateGraph, {
        output$graphPlot <- renderVisNetwork({
            # generate nodes based on input$nodes from ui.R
            x  <- erdos.renyi.game(
                isolate(input$nodes),
                isolate(input$edges),
                type = "gnm"
            )
            
            # draw the network with the specified number of nodes
            #plot(x, vertex.label= NA, edge.arrow.size= 0.02, vertex.size = 0.5, xlab = "Random Network: G(N,L) model")
            visIgraph(x)
        })
    })
})
