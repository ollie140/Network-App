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


sidebar <- dashboardSidebar(
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
    ),
    actionButton(inputId = "saveGraph", label = "Save graph")
)

body <- dashboardBody(div(
    box(
        id = "graphPlotDiv",
        style = 'width: 100%; height: 400px',
        visNetworkOutput('graphPlot', width = "100%", height = "100%"),
        title = "Test box",
        width = "100%",
        height = '100%',
        collapsible = T,
        collapsed = F
    )
))


dashboardPage(dashboardHeader(title = "Graph Plot Test"),
              sidebar,
              body)
