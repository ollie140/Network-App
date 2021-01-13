#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(visNetwork)
library(igraph)
library(shinyWidgets)
library(shinyjqui)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    useShinydashboard(),
    # Application title
    titlePanel("Random Network"),
    
    # Sidebar with a slider input for number of nodes and edges
    sidebarLayout(
        sidebarPanel(
            sliderInput(
                "nodes",
                "Number of Nodes:",
                min = 1,
                max = 50,
                value = 30
            ),
            sliderInput(
                "edges",
                "Number of Edges:",
                min = 1,
                max = 100,
                value = 30
            )
        ),
        
        # Show a plot of the generated network
        mainPanel(jqui_resizable(
            box(
                visNetworkOutput("graphPlot"),
                solidHeader = T,
                status = "primary",
                width = "100%",
                height = "100%",
                title = "Test box",
                collapsible = T,
                collapsed = F
            )
        ))
    )
))



# Limit the resizable element to a maximum or minimum height or width
#jqui_resizable('#foo', options = list(minHeight = 100, maxHeight = 300,
 #                                     minWidth = 200, maxWidth = 400))

