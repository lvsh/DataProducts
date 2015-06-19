library(shiny)

# Load cars data
data(cars)
# Fit linear model
m <- lm(dist ~ speed, data=cars)
# Compute endpoint of fitted line for plot
endpoints_x <- c(min(cars$speed),max(cars$speed))
endpoints_y <- c(m$coef[1]+m$coef[2]*min(cars$speed),m$coef[1]+m$coef[2]*max(cars$speed))

shinyServer(function(input, output) {
  
  # Compute stopping distance for slider value
  output$sdist <- renderText(m$coef[1]+m$coef[2]*input$speed)
    
  # Plot cars data, overlay linear model, and predicted point
  output$weightPlot <- renderPlot({    
    plot.new()
    plot.window(xlim=endpoints_x,ylim=c(min(cars$dist),max(cars$dist)))
    axis(1)
    axis(2)
    title(xlab='Driving speed (mph)')
    title(ylab='Stopping distance (ft)')
    box()
    points(x=cars$speed,y=cars$dist,col='skyblue',pch=19,cex=1.5)
    lines(x=endpoints_x,y=endpoints_y,col='coral',lwd=3)
    points(x=input$speed,y=m$coef[1]+m$coef[2]*input$speed,col='coral',pch=19,cex=2)  
    
  })
})
