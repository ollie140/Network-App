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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Random Network"),
    
    # Sidebar with a slider input for number of nodes and edges
    sidebarLayout(sidebarPanel(
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
    mainPanel(
        box(
            visNetworkOutput("graphPlot"),
            solidHeader = T,
            status = "primary",
            width = "100%",
            height = 250,
            title = "Test box",
            collapsible = T,
            collapsed = F
        )
    ))
))
