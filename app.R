# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("superhero"),
    navbarPage(
      # theme = "cerulean",  # <--- To use a theme, uncomment this
      "Shiny App 01",
      tabPanel("Navbar 1",
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("txt1", "First Name:", ""), #txt1 will be sent to the server
                 textInput("txt2", "Surname", ""), #txt2 will be sent to the server
                 
               ), # sidebarPanel
               mainPanel(
                            h2("Header"),
                            h4("Full Name"),
                            verbatimTextOutput("txtout"), #txtout is generated from the server

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2","Tab 2"),
      tabPanel("Navbar 3", "Tab 3")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
  } # server
  

  # Create Shiny object 
  shinyApp(ui = ui, server = server)
