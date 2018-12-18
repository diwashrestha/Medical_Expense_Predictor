##Codes for the UI

library(shiny) 
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("united"),
  
  # Application title
  titlePanel("Medical Insurance Predictor"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = 'smoke',
        label = 'Smoker' ,
        levels(insurance$smoker)
      ),
      
      selectInput(
        inputId = 'region',
        label = 'Select Region',
        levels(insurance$region)
      ),
      
      selectInput(inputId = 'sex', label = "Select Gender",
                  levels(insurance$sex)),
      
      numericInput(
        inputId = 'age',
        label = 'Age ',
        30,
        min = 1
      ),
      numericInput(
        inputId = 'children',
        label = 'No. of Children:',
        1,
        min = 0
      ),
      numericInput(inputId = 'bmi', label = 'BMI(Body Mass Index)', 20),
      actionButton('predict', "Predict", icon = icon("refresh"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(tabsetPanel(
      tabPanel(
        icon = icon("table"),
        "Prediction:",
        tableOutput('table'),
        tags$h4("Medical Expenses:", icon("dollar")),
        tags$h4(textOutput('insurance'))
      ),
      
      tabPanel(
        icon = icon("book"),
        title = "About",
        tags$div(
          "This application predict the Medical care expenses
          using the given input from user.The Data used for this application is taken from
          ",
          tags$a("Kaggle.", href = "https://www.kaggle.com/mirichoi0218/insurance"),
          tags$br(),
          tags$br(),
          "This data was created using demograpic statistics from
          the US Census Bureu and thus approximately reflect real world conditions.Features of the datsets:",
          tags$br(),
          tags$ul(
            tags$li(
              "age : An integer indicating the age of the primary beneficiary (excluding those above
              64 years, since they are generally covered by the government).",
              tags$li("sex : The policy holder's gender, either male or female"),
              tags$li(
                "bmi : The body mass index (BMI), which provides a sense of how over- or
                under-weight a person is relative to their height. BMI is equal to weight (inkilograms)
                divided by height (in meters) squared. An ideal BMI is within the range of 18.5 to 24.9."
              ),
              tags$li(
                "children : An integer indicating the number of children/dependents covered by
                the insurance plan."
              ),
              tags$li(
                "smoker : A yes or no categorical variable that indicates
                whether the insured"
              ),
              tags$li(
                "region : The beneficiary's place of residence in the US, divided into four regularly
                smokes tobacco. geographic regions: northeast, southeast, southwest, or northwest."
              )
              )
              )
          ),
        tags$br(),
        "The application is built with the" ,
        tags$a("Shiny", href = "https://shiny.rstudio.com/"),
        " framework for the R programming language.Multiple Linear Regression algorithm was used to fit the model."
        ,
        tags$br(),
        tags$br(),
        tags$p(
          "Code for the application is available at https://github.com/sdiwash/Electric-Dashboard.I welcome feedback and suggestions! Please visit my ",
          tags$a("personal website", href = "https://diwashrestha.com/"),
          "for contact information or connect with me on",
          tags$a("Twitter.", href = "https://twitter.com/diwastha"),
          " "
        ),
        
        tags$div()
      )
      
      
      
  ))
  )
    ))
