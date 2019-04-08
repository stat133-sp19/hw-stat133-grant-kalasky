library(shiny)

ui <- fluidPage(
  # App Tite
  titlePanel("Savings Modalities"),
  
  # Row of input widgets
  fluidRow(
    column(4,
           sliderInput(inputId="init_amount",
                       label="Initial Amount",
                       min=1, max=100000,
                       value = 1000, step = 500,
                       pre = "$", sep = ","),
           sliderInput(inputId = "annual_contrib",
                       label="Annual Contribution",
                       min=0, max=50000,
                       value = 2000, step = 500,
                       pre = "$", sep = ",")
    ),
    column(4,
           sliderInput(inputId = "return_rate",
                       label="Return Rate (in %)",
                       min=0, max=20,
                       value = 5, step = 1),
           sliderInput(inputId = "growth_rate",
                       label="Growth Rate (in %)",
                       min=0, max=20,
                       value = 2, step = 1)
    ),
    column(4,
           sliderInput(inputId = "years",
                       label="Years",
                       min=0, max=50,
                       value = 20, step = 1),
           selectInput(inputId = "facet",
                       label = "Facet?",
                       c("No", "Yes"))
    )
  )
  
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)