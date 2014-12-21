## server.R
## mtcars regression

## fit the model once
model <- lm(formula = mpg ~ hp + cyl + wt, data = mtcars)


## 
shinyServer(
  function(input, output) {
    dataInput <- reactive({
        data.frame(hp = as.numeric(input$hp), wt = as.numeric(input$wt), cyl = as.numeric(input$cyl))
        })
    # dataInput
    #inputFrame <- dataInput()
    #output$mpg <- renderPrint(dataInput()$hp)
    output$mpg <- renderPrint(predict(model,dataInput(),type = "response")[[1]])
  }
)
