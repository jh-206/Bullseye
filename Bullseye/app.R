
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  DT::dataTableOutput("lags", width = 300), tags$hr(),
   
  selectInput(inputId = "lag_input", label = "Lag", choices = 1:100),
  
  actionButton("record", "Record")
  
   # Application title
   # titlePanel("Bullseye Project"),
   
   # Sidebar with a slider input for number of bins 
   # sidebarLayout(
   #   sidebarPanel(
   #     selectInput(inputId = "lag_input", label = "Lag", choices = 1:100)
   #   ),
      
      # mainPanel(
      #   tabsetPanel(
      #     type = "tab",
      #     tabPanel("Data Collection",
      #              textOutput("tracker")
      #     ),
      #     tabPanel("Analysis",
      #              tableOutput("bullseye_table")
      #     )
      #   )
      # )
   # )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  saveData <- function(data) {
    data <- as.data.frame(t(data))
    if (exists("lags")) {
      lags <<- rbind(lags, data)
    } else {
      lags <<- data
    }
  }
  
  loadData <- function() {
    if (exists("lags")) {
      lags
    }
  }
  
  lagData <- reactive({
    input$lag_input
  })
  
  observeEvent(input$submit, {
    saveData(lagData())
  })
  
  output$lags <- DT::renderDataTable({
    input$submit
    loadData()
  })     
   
   # output$tracker <- renderText({
   #   print(input$lag_input)
   # })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

