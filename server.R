library(shiny)
library(ggplot2) 
library(ggthemes) 
library(scales) 
library(plyr) 

visa <- read.csv("data/visa_consolidated.csv")
visaa <- aggregate( .~ COUNTRY + year, data=visa, FUN=sum)

shinyServer(function(input, output) {
  output$visaPlot <- renderPlot({
            input$goButton 
            isolate(visass <- subset(visaa, year == input$year, select=c("COUNTRY",input$visatype)))
            ggplot(visass, aes(x=visass[,1], y=visass[,2]),environment = environment()) +
            scale_y_continuous(expand = c(0,0))+
            expand_limits(y = c(0,1.05 *max(visass[,2])))+
	    theme_wsj() +
            theme(axis.text.x  = element_text(size=10,
                                      angle=90,
                                      colour="blue",
                                      vjust=1,
                                      hjust=1)) +
            geom_text(aes(x = visass[,1], 
                  y = visass[,2], 
                  label = visass[,2], 
                  angle  = 90, 
                  size = 5, 
                  hjust = -0.1), 
                  color = "red", 
                  show_guide  = F) +
            geom_bar(stat="identity")
  })
})


