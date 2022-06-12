# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("superhero"),
    navbarPage(
      "Shiny App 01",
      tabPanel("Navbar 1",
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("input_1", "First Name:", ""), #input1 will be sent to the server
                 textInput("input_2", "Surname", ""), #input2 will be sent to the server
                 
               ), # sidebarPanel
               mainPanel(
                            h2("Header"),
                            h4("Full Name"),
                            verbatimTextOutput("output_1"), #generated from the server

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2","Tab 2"),
      tabPanel("Navbar 3", "Tab 3")
  
    ) #
  ) 

  
  # Define server function
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
  }
  

  # Create Shiny object 
  shinyApp(ui = ui, server = server)
