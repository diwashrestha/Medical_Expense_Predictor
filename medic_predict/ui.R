#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("spacelab"),
  
  # Application title
  titlePanel("Medical Insurance Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = 'smoke', label = 'Smoker' , 
                  levels(insurance$smoker)),
      
      selectInput(inputId = 'region', label = 'Select Region',
                  levels(insurance$region)),
      
      selectInput(inputId = 'sex', label = "Select Gender", 
                  levels(insurance$sex)),
      
      numericInput(inputId = 'age', label = 'Age ',10, 
                   min = 1),
      numericInput(inputId = 'children', label = 'No. of Children:',10,
                   min = 0),
      numericInput(inputId = 'bmi', label = 'BMI(Body Mass Index)',10),
      actionButton('predict',"Predict",icon = icon("refresh"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(

      tabsetPanel(
        tabPanel(icon = icon("book"),title= "About",tags$div("The Goal of this data analysis is to use patient data to etimate the average mediacal care 
                                         expenses for such population segments.These estimates can be used to create acturial tables 
                                         that set the price of yearly premiums higher  or lower, depending on the expected treatment 
                                         costs.For this analysis, i will use a simulated datasets containing hypothetical medical expenses
                                         for patients in the United States.This data was created using demograpic statistics from 
                                         the US Census Bureu and thus approximately reflect real world conditions.Features of the datsets:",
                                         tags$br(),
                                         tags$ul(
                                           tags$li("age : An integer indicating the age of the primary beneficiary (excluding those above 
                                                   64 years, since they are generally covered by the government).",
                                                   tags$li("sex : The policy holder's gender, either male or female"),
                                                   tags$li("bmi : The body mass index (BMI), which provides a sense of how over- or 
                                                           under-weight a person is relative to their height. BMI is equal to weight (inkilograms) 
                                                           divided by height (in meters) squared. An ideal BMI is within the range of 18.5 to 24.9."),
                                                   tags$li("children : An integer indicating the number of children/dependents covered by 
                                                           the insurance plan."),
                                                   tags$li("smoker : A yes or no categorical variable that indicates whether the insured"),
                                                   tags$li("region : The beneficiary's place of residence in the US, divided into four regularly 
                                                           smokes tobacco. geographic regions: northeast, southeast, southwest, or northwest."))))),
          

        tabPanel(icon = icon("table"),"Your Data:", tableOutput('table'),tags$h4("Medical Expenses:",icon("dollar")),tags$h4(textOutput('insurance')))
      )
    )
  )
))
