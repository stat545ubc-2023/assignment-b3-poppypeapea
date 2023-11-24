# Yearly Flow Trend Analysis

## Description
This Shiny web application is designed for analyzing flow trends throughout each year, providing interactive visualizations to explore how flow changes on a monthly basis. The application is built using R and leverages the Shiny framework for interactive web applications.

## Features
- **Interactive Flow Trend Plot**: Allows users to select a specific year and visualize the flow trend across months.
- **Monthly Observations Table**: Displays the number of flow observations recorded for each month to identify patterns or anomalies.

## Live Application
Access the live version of this application here: [Flow Trend Analysis App](https://poppypeapea.shinyapps.io/flowrate/).

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
Make sure you have R installed on your system. You can download it from [The Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/).

### Installation
To run this application locally, you'll need to install the following R packages: `shiny`, `datateachr`, `tidyverse`, and `DT`. Execute the following command in R:

```R
install.packages(c("shiny", "datateachr", "tidyverse", "DT"))
