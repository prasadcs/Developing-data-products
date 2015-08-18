library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).

library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Visas issued versus country"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("visatype", "VISA TYPE:", 
                    choices=c('BUSINESS','CONFERENCE','DIPLOMATIC','MEDICAL','STUDENT','TRANSIT',
                              'DIPLOMATIC_DEPENDANT','EMPLOYMENT_SPOUSE','ENTRY','MEDICAL_ATTENDENT',
                              'MISSIONARY','PILGRIMAGE','RESEARCH','PROJECT','VISIT','ART_SURROGACY',
                              'LONG_TERM_TRANSFER','TOURIST','BUS_SPOUSE','BUSINESS_TRANSFER')),
        selectInput("year", "YEAR:", 
                    choices=c(2011,2012,2013)),

        hr(),
 	actionButton("goButton", "Go!"),
        helpText("Click on Go button to refresh the data")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("visaPlot")  
      )
      
    )
  )
)