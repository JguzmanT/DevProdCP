#Developing Data Products Course Project
#Date: 7/10/2020
#Author: jguzmant 
#UI file
library(plotly)

ui <- fluidPage(
    headerPanel('K-means MTCARS'),
    sidebarPanel(
        selectInput('xcol','X axis', names(mtcars)),
        selectInput('ycol','Y axis', names(mtcars)),
        numericInput('clusters', 'Number of Clusters', 2, min = 2, max = 6),
        selected = names(mtcars)[[2]]),
    mainPanel(
        plotlyOutput('plot')
    )
)