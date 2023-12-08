# Water Flow Analysis Tool

## Description
The Water Flow Analysis Tool is an interactive Shiny web application designed for comprehensive analysis of water flow trends. It leverages the `datateachr` dataset to provide insightful visualizations of flow data across different years. This tool is especially useful for hydrologists, environmental scientists, and data enthusiasts interested in understanding temporal flow patterns.

## Key Features
- **Yearly Flow Trend Visualization**: Users can select a year to view the flow trend displayed as a line graph, showing changes in flow over the months.
- **Comparative Flow Analysis**: Facilitates the comparison of flow trends between two different years, allowing for side-by-side trend analysis.
- **Monthly Observations Table**: A dynamic table displaying the count of flow observations for each month, aiding in identifying monthly data distribution and patterns.
- **Data Filtering and Visualization**: Interactive feature allowing users to filter and visualize data from the `mtcars` dataset, including plot type selection and cylinder count filtering.
- **Dynamic Plotting**: Depending on user selections, the app dynamically generates either a bar chart or a line graph for the `mtcars` dataset.
- **Summary Statistics**: Provides summary statistics of the filtered dataset, offering insights into data distribution and key metrics.

## Live Application
You can access the application at [Water Flow Analysis Tool](https://poppypeapea.shinyapps.io/flowrate/).

## Getting Started

### Prerequisites
- R and RStudio installed on your system. Download R from [CRAN](https://cran.r-project.org/) and RStudio from [RStudio's website](https://www.rstudio.com/products/rstudio/download/).

### Installation
Install the necessary R packages by executing the following command in R:

```R
install.packages(c("shiny", "datateachr", "tidyverse", "DT", "ggplot2"))
