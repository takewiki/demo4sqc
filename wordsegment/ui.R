#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#library(jiebaR)
library(shiny)
library(shinyAce)
library(rJava)
library(Rwordseg)


# Define UI for application that draws a histogram
shinyUI(
  bootstrapPage(div(
    class="container-fluid",
    div(class="row-fluid",
        div(class="span6",
            h2("输入文本"),  
            aceEditor("code", mode="r", 
                      value='我爱R语言，我爱文本挖掘',
                      fontSize = 16,
                      theme ="vibrant_ink" ),
            actionButton("eval", "分词")
        ),
        div(class="span6",
            h2("输出文本"),
            verbatimTextOutput("output")
        )
    )
  ))
  
  
)
