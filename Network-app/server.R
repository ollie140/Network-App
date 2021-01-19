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
    
        output$graphPlot <- renderVisNetwork({
            # generate nodes based on input$nodes from ui.R
            randNetwork  <- erdos.renyi.game(
                input$nodes,
                input$edges,
                type = "gnm"
            )
            
            # draw the network with the specified number of nodes
            visIgraph(randNetwork)
        })
        
        ##doesnt work, use reactive function: https://stackoverflow.com/questions/52029794/r-shiny-saving-reactive-ggplots
#        eventReactive(input$saveGraph, { ##isolate the input if we dont want graph to update dynamically
#            htmlwidgets::saveWidget(randNetwork, "network.html")
#        })
})
