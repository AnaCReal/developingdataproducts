#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
library(data.table)
shinyUI(fluidPage(
    titlePanel("Personal savings per country"),
    sidebarLayout(
        sidebarPanel(
            h4("Instructions"),
            h5("You can give a look to the dataset first and then see the model behind every variable in the next tab,
               to understand your predictor you can go to the Summary tab and get a view at your predictor."),
            h5("You can just select one predictor at a time, by default all the checkboxes are selected and
               the last one is displayed."),
            checkboxInput("showModel1", "Predictor 1: Numeric % of population under 15", value = TRUE),
            checkboxInput("showModel2", "Predictor 2: Numeric % of population under over", value = TRUE),
            checkboxInput("showModel3", "Predictor 3: Numeric real per-capita disposable income", value = TRUE),
            checkboxInput("showModel4", "Predictor 4: Numeric % growth rate of dpi", value = TRUE)
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Savings per person per country for 50 countries",tableOutput("table1")),
                tabPanel("You can choose the predictor you want to estimate the personal savings",
                plotOutput("plot1")),
                tabPanel("Summary, see the boxplot of the predictors", plotOutput("plot2"))
            )
        )
    )
))
