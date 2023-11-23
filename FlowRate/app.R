# Made by Poppy Li - Nov 23 2023
#
# This is a Shiny web application for analyzing flow trends over each year.
# You can run the application by clicking 'Run App' in RStudio.

# load necessary libraries
library(shiny)
library(datateachr)
library(tidyverse)
library(DT)


# Define data to use
flow_sample <- datateachr::flow_sample

# Calculate observations per month
month_obs_count <- flow_sample %>%
  group_by(month) %>%
  summarise(obs_count = n())

# Define UI for the application
ui <- fluidPage(
  titlePanel("Yearly Flow Trend Analysis"),
  img(src = "splashing.jpeg", height = "100px", width = "auto"),
  br(),
  h4("Explore how flow changes throughout each year"),
  br(),
  
  sidebarLayout(
    sidebarPanel(
      # Slider for selecting a specific year
      sliderInput("year", "Select a Year:", 
                  min = min(flow_sample$year), 
                  max = max(flow_sample$year), 
                  value = min(flow_sample$year)),
      
      # Display the number of observations per month
      tableOutput("obsTable")
    ),
    
    mainPanel(
      # Plot the flow trend for the selected year
      plotOutput("flowTrendPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Render table of observations per month
  output$obsTable <- DT::renderDataTable({
    month_obs_count
  })
  
  # Render plot for flow trend
  output$flowTrendPlot <- renderPlot({
    flow_sample %>%
      filter(year == input$year) %>%
      ggplot(aes(x = month, y = flow)) +
      geom_line() +
      labs(title = paste("Flow Trend for the Year", input$year),
           x = "Month",
           y = "Flow")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
