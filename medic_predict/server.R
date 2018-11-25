#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
source("/home/diwash/Projects/Medical_Expense_Predictor/model.R")

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
test <- reactive({
  age <- as.integer(input$age)
  sex <- as.character(input$sex)
  bmi <- as.integer(input$bmi)
  children <- as.integer(input$children)
  smoker <- as.character(input$smoke)
  region <- as.character(input$region)
  age2 <- as.integer(input$age^2)
  bmi30 <- as.integer(ifelse(input$bmi >= 30 ,1,0))

  
  fest <- cbind(age,sex,bmi,children,smoker,region,age2,bmi30)
  
  test <- cbind.data.frame(age, sex, bmi, children, smoker, region,age2,bmi30)
  test <- as.data.frame(test)
  
  
})

data <- reactive({
  bata <- read.csv("/home/diwash/Projects/Medical_Expense_Predictor/data/insurance.csv")
  bata$age2 <- bata$age^2
  bata$bmi30 <- ifelse(bata$bmi >= 30 ,1 ,0)
  data <- bata
})


pred <- eventReactive(input$predict,{
  model <-  lm(charges~ age + age2 + children + bmi + sex + bmi30*smoker + region , data = data())
  predict(model,test())
})
  output$insurance <- renderText(pred())
  output$table <- renderTable(test())
})

