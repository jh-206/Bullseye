
library(shiny)

# Source Initiate Script
source(file.path(getwd(), "Scripts", "initiateApp.R"))

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("Bullseye Project"),
  
  mainPanel(
    tabsetPanel(
      type = "tab",
      tabPanel("Record Data",
               fluidRow(
                 column(width = 7,
                        textInput(inputId = "user_input", label = "User"),
                        selectInput(inputId = "lag_input", label = "Lag", choices = 1:100),
                        checkboxInput("red_bull_input", "Double Bullseye", FALSE),
                        
                        actionButton("record", "Record")),
                 column(width = 5,
                       DT::dataTableOutput("lags", width = 300), tags$hr())
               )
      ),
      tabPanel("Analyze",
               fluidRow(
                 column(width = 4,
                        selectInput(inputId = "analysis_input", label = "Analysis Type", choices = c("Basic Summary", "Time Series", "Poisson Process"))),
                 column(width = 8,
                        textOutput(outputId = "analysis_output"))
               )
      )
    )
  )
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  lagData <- reactive({
    data <- sapply(fields, function(x) input[[x]])
    data
  })
  
  observeEvent(input$record, {
    saveData(lagData())
  })
  
  output$lags <- DT::renderDataTable({
    input$record
    loadData()
  }, colnames = c("Lag", "Red"))     
   
   output$analysis_output <- renderText({
     print(input$analysis_input)
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

