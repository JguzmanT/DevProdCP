library(plotly)

ui <- fluidPage(
    headerPanel('K-means MTCARS'),
    sidebarPanel(
        selectInput('xcol','X Variable', names(mtcars)),
        selectInput('ycol','Y Variable', names(mtcars)),
        numericInput('clusters', 'Number of Clusters', 2, min = 2, max = 6),
        selected = names(mtcars)[[2]]),
    mainPanel(
        plotlyOutput('plot')
    )
)