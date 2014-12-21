# UI for cars regression
#
library(shiny)
shinyUI(pageWithSidebar(
 headerPanel("Predicting Fuel Efficiency from Car Characteristics"),
 sidebarPanel(
 h3('Input Data'),
 h4('Type in horsepower, select weight range of vehicle and number of engine cylinders.'),
 h4('Then press "Predict MPG" button, which will project MPG from characteristics.'),
 numericInput('hp', 'Engine Horse Power', 100, min = 0, max = 500, step = 1),
radioButtons("wt", "Vehicle Weight Range (lbs)", c(                                  
                                      "  500 - 1,499" = "1",
                                      "1,500 - 2,499" = "2",
                                      "2,500 - 3,499" = "3",
                                      "3,500 - 4,499" = "4",
                                      "4,500 +"       = "5"),
                selected = "3"),
radioButtons("cyl", "Engine Number of Cylinders", c("4" = "4",
                                          "6" = "6",
                                          "8" = "8"),
             selected = "6"),
submitButton(text = "Predict MPG", icon = NULL)
 ),
 mainPanel(
 h3('Model Prediction'),
 h4('Model based on glm fitted to predict MPG from horsepower, weight and number of cylinders'),
 h4('Model fit using mtcars data, extracted from 1974 Motor Trend covering 32 1973-1974 models of automobile.'),
 helpText(a("mtcars link", href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")),
 h4('Predicted MPG  = '),
 verbatimTextOutput("mpg")
 )
))

