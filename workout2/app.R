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
  ),
  
  mainPanel(
    h4("Timeline"),
    
    h4("Balances"),
    verbatimTextOutput("table")
  )
)

server <- function(input, output) {
  total_years <- reactive({input$years})
  init_amount <- reactive({input$init_amount})
  annual_contrib <- reactive({input$annual_contrib})
  return_rate <- reactive({input$return_rate / 100})
  growth_rate <- reactive({input$growth_rate / 100})
  
  output$table <- renderPrint({
    #################################
    #### Define helper functions ####
    #################################
    
    future_value <- function(amount, rate, years) {
      return(amount * ((1 + rate)^years))
    }
    
    annuity <- function(contrib, rate, years) {
      ratio <- ((1 + rate)^years - 1) / rate
      return(contrib * ratio)
    }
    
    growing_annuity <- function(contrib, rate, growth, years) {
      ratio <- ((1 + rate)^years - (1 + growth)^years) / (rate - growth)
      return(contrib * ratio)
    }
    
    ###############################
    #### Create Balances Table ####
    ###############################
    years <- seq(0, total_years(), 1)
    no_contrib <- rep(0, total_years() - 1)
    fixed_contrib <- rep(0, total_years() - 1)
    growing_contrib <- rep(0, total_years() - 1)
    
    for (i in c(0:total_years())) {
      no_contrib[i+1] <- future_value(amount = init_amount(), 
                                      rate = return_rate(), 
                                      years = i)
      fixed_contrib[i+1] <- no_contrib[i+1] + annuity(contrib = annual_contrib(),
                                                      rate = return_rate(), 
                                                      years = i)
      growing_contrib[i+1] <- no_contrib[i+1] + growing_annuity(contrib = annual_contrib(), 
                                                                rate = return_rate(), 
                                                                growth = growth_rate(), 
                                                                years = i)
    }
    
    balance_table <- data.frame(
      years = years,
      no_contrib = no_contrib,
      fixed_contrib = fixed_contrib,
      growing_contrib = growing_contrib
    )
    
    print(balance_table)
  })
  
  
  ###############################
  #### Create Timeline Graph ####
  ###############################
}

shinyApp(ui = ui, server = server)