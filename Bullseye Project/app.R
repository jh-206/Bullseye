
library(shiny)

# Define the fields we want to save from the form
fields <- c("lag_input", "red_bull_input")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("Bullseye Project"),
  
  mainPanel(
    tabsetPanel(
      type = "tab",
      tabPanel("Record Data",
               fluidRow(
                 column(width = 7,
                        selectInput(inputId = "lag_input", label = "Lag", choices = 1:100),
                        checkboxInput("red_bull_input", "Double Bullseye", FALSE),
                        
                        actionButton("record", "Record")),
                 column(width = 5,
                       DT::dataTableOutput("lags", width = 300), tags$hr())
               )
      ),
      tabPanel("Analyze"
               
      )
    )
  )
   
  
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
    data <- sapply(fields, function(x) input[[x]])
    data
  })
  
  observeEvent(input$record, {
    saveData(lagData())
  })
  
  output$lags <- DT::renderDataTable({
    input$record
    loadData()
  })     
   
   # output$tracker <- renderText({
   #   print(input$lag_input)
   # })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

