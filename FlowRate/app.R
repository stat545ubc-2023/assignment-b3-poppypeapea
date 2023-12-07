library(shiny)
library(datateachr)
library(tidyverse)
library(DT)
library(ggplot2)

# Define data to use
flow_sample <- datateachr::flow_sample

# Calculate observations per month
month_obs_count <- flow_sample %>%
  group_by(month) %>%
  summarise(obs_count = n())

# Define UI for the application
ui <- fluidPage(
  titlePanel("Water Flow Analysis Tool"),
  img(src = "splashing.jpeg", height = "200px", width = "auto"),
  br(),
  h4("Explore and Compare Water Flow Trends"),
  br(),
  
  sidebarLayout(
    sidebarPanel(
      h5("Flow Trend Analysis"),
      sliderInput("year", "Select Year:", 
                  min = min(flow_sample$year), 
                  max = max(flow_sample$year), 
                  value = min(flow_sample$year)),
      sliderInput("compareYear", "Compare with Year:", 
                  min = min(flow_sample$year), 
                  max = max(flow_sample$year), 
                  value = min(flow_sample$year)),
      h5("Monthly Observations"),
      DT::dataTableOutput("obsTable")
    ),
    mainPanel(
      plotOutput("flowTrendPlot"),
      plotOutput("compareFlowPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$obsTable <- DT::renderDataTable({ month_obs_count })
  
  output$flowTrendPlot <- renderPlot({
    flow_sample %>%
      filter(year == input$year) %>%
      ggplot(aes(x = month, y = flow)) + geom_line() +
      labs(title = paste("Flow Trend for", input$year),
           x = "Month", y = "Flow")
  })
  
  output$compareFlowPlot <- renderPlot({
    data1 <- flow_sample %>% filter(year == input$year)
    data2 <- flow_sample %>% filter(year == input$compareYear)
    
    ggplot() +
      geom_line(data = data1, aes(x = month, y = flow), color = "blue") +
      geom_line(data = data2, aes(x = month, y = flow), color = "red") +
      labs(title = paste("Comparison of Flow Trends:", input$year, "vs", input$compareYear),
           x = "Month", y = "Flow")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
