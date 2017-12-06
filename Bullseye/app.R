
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Bullseye Project"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     sidebarPanel(
       selectInput(inputId = "lag_input", label = "Lag", choices = 1:100)
     ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(
          type = "tab",
          tabPanel("Data Collection",
                   textOutput("tracker")
          ),
          tabPanel("Analysis",
                   tableOutput("bullseye_table")
          )
        )
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$tracker <- renderText({
     print(input$lag_input)
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

