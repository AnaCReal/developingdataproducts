#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
library(data.table)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model1 <- lm(sr ~ pop15, data = LifeCycleSavings)
    model2 <- lm(sr ~ pop75, data = LifeCycleSavings)
    model3 <- lm(sr ~ dpi, data = LifeCycleSavings)
    model4 <- lm(sr ~ ddpi, data = LifeCycleSavings)
    
    output$table1 <- renderTable(data.frame("country"=rownames(LifeCycleSavings),LifeCycleSavings))
    
    output$plot1 <- renderPlot({
        
        if(input$showModel1){
            plot(LifeCycleSavings$sr, LifeCycleSavings$pop15, xlab = "Personal Savings", 
                 ylab = "Numeric % of population under 15", bty = "n", pch = 16,
                 xlim = c(0,21), ylim = c(0,45))
            abline(model1, col = "purple", lwd = 2)
        }
        
        if(input$showModel2){
            plot(LifeCycleSavings$sr, LifeCycleSavings$pop75, xlab = "Personal Savings", 
                 ylab = "Numeric % of population over 75", bty = "n", pch = 16,
                 xlim = c(0,21), ylim = c(0,10))
            abline(model2, col = "purple", lwd = 2)
        }
        
        if(input$showModel3){
            plot(LifeCycleSavings$sr, LifeCycleSavings$dpi, xlab = "Personal Savings", 
                 ylab = "Numeric real per-capita disposable income", bty = "n", pch = 16)
            abline(model3, col = "purple", lwd = 2)
        }
        
        if(input$showModel4){
            plot(LifeCycleSavings$sr, LifeCycleSavings$ddpi, xlab = "Personal Savings", 
                 ylab = "Numeric % growth rate dpi", bty = "n", pch = 16)
            abline(model4, col = "purple", lwd = 2)
        }
        
        legend(25, 250, c("Model 1", "Model 2", "Model 3", "Model 4"), pch = 16, 
               col = c("orange", "black", "magenta", "green"), bty = "n", cex = 1.2)
        })
    
    output$plot2 <- renderPlot({
        if(input$showModel1){
            boxplot(LifeCycleSavings$pop15, main = "Numeric % population under 15")
        }
        if(input$showModel2){
            boxplot(LifeCycleSavings$pop75, main = "Numeric % population over 75")
        }
        if(input$showModel3){
            boxplot(LifeCycleSavings$dpi, main = "Numeric real per-capita disposable income")
        }
        if(input$showModel4){
            boxplot(LifeCycleSavings$ddpi, main = "Numeric % growth rate of dpi")
        }
    })
})

