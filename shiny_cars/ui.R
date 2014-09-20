library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("MPG Prediction Data App"),

  # Sidebar with a slider input for the HP 
  sidebarLayout( position = "right",
    sidebarPanel( "Your inputs:",
      br(),
      sliderInput("HP",
                  "Horse Power of your vehicle:",
                  min = 50,
                  max = 340,
                  value = 90),
      br(),
      checkboxInput ("ami", label="Manual Transmission", value = FALSE),
      br(), 
      submitButton("Submit"),
      p(em("Documentation:",a("Documentation",href="Index.html"))),
      p(em("Pitch:",a("Pitch",href="mtcars_pitch.html")))
    ),

    # Show a plot
    mainPanel(
      h6("I guess the weight of your vehicle is..."),
      #verbatimTextOutput("We are guessing the weight\n of your wehicle based on HP..."),
      tableOutput("results"),
      h6("and now we predict your MPG to be"),
      plotOutput("mpgPlot")
    )
  )
))
