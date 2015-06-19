library(shiny)
 
shinyUI(fluidPage(
  
  titlePanel("Data Products Course Project"),
  
  fluidRow(
    column(8,
           p('This app predicts the stopping distance of a vehicle given the driving speed. 
           Use the slider to the right to select the driving speed. The predicted stopping 
           distance is shown in the plot below as an orange dot, and on the right as a number.' ),
           p('The ', em('cars'),'dataset in R is used to make the prediction. In the plot below,
           a linear model (orange line) is fit to the ',em('cars'),' data (blue dots) using',
           code('lm(dist~speed,data=cars)'),'. The fitted coefficients are used to compute the
           predicted stopping distance.')           
      ),
    column(4,
           sliderInput("speed",
                        "Driving speed (mph)",
                        min = 5,
                        max = 25,
                        value = 10),
           p(strong('Predicted stopping distance (ft)')),
           textOutput('sdist')           
           )
  ),
  
  plotOutput("weightPlot")
  
))
