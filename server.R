#Developing Data Products Course Project
#Date: 7/10/2020
#Author: jguzmant 
#Shiny Server file
function(input, output,session) {
    
    x <- reactive({
        mtcars[,input$xcol]
    })
    
    y <- reactive({
        mtcars[,input$ycol]
    })
    
    selectedData <- reactive({
        mtcars[, c(input$xcol, input$ycol)]
    })
    
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    
    
    output$plot <- renderPlotly(
        plot1 <- plot_ly(selectedData(),
            type = 'scatter',
            mode = 'markers')
        %>% add_trace(x=~x(),y=~y(),
                      color=~clusters()$cluster,
                      type="scatter",
                      name="Values")
        %>% add_markers(x=~clusters()$centers[,1],
                      y=~clusters()$centers[,2],
                      type="scatter",
                      color="red",
                      marker = list(symbol = 'cross'),
                      name="Cluster Mean",
                      size=10
                      )
    )
    
}