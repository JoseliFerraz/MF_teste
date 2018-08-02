#-----------------------------------------------------------------------
#------------------
# Area de teste
#------------------

# # Define server logic ----
# library()
# server <- function(input, output) {
#   
#   output$selected_file <- renderDataTable({ 
#     paste("You have selected", input$file)
#   })
#   
# }
# # Run the app ----
# #shinyApp(ui = ui, server = server)
#-----------------------------------------------------------------------
library(shiny)

shinyServer(function(input,output){
  
  # This reactive function will take the inputs from UI.R and use them for read.table() to read the data from the file. It returns the dataset in the form of a dataframe.
  # file$datapath -> gives the path of the file
  data <- reactive({
    file1 <- input$file
    if(is.null(file1)){return()} 
    read.table(file=file1$datapath, sep=input$sep, header = input$header, stringsAsFactors = input$stringAsFactors)
    # inserir uma aba para a atulizacao aki acionada apos pressionar o butao
    # deve-se criar um codigo para adicionar ao butao
    #https://shiny.rstudio.com/gallery/actionbutton-demo.html
  })
  
  # this reactive output contains the summary of the dataset and display the summary in table format
  output$filedf <- renderTable({
    if(is.null(data())){return ()}
    input$file
  })
  
  # this reactive output contains the summary of the dataset and display the summary in table format
  output$sum <- renderTable({
    if(is.null(data())){return ()}
    summary(data())
    
  })
  
  # This reactive output contains the dataset and display the dataset in table format
  output$table <- renderTable({
    if(is.null(data())){return ()}
    data()
  })
  
  # the following renderUI is used to dynamically generate the tabsets when the file is loaded. Until the file is loaded, app will not show the tabset.
  output$tb <- renderUI({
    if(is.null(data()))
      h5("Powered by", tags$img(src='RStudio-Ball.png', heigth=200, width=200))
    else
      tabsetPanel(tabPanel("About file", tableOutput("filedf")),tabPanel("Data", tableOutput("table")),tabPanel("Summary", tableOutput("sum")))
  })
  
  # Atualizacao. Until the file is loaded, app will not show the tabset.
  # output$Atual <- renderUI({
  #   if(is.null(data()))
  #     h5("Powered by", tags$img(src='RStudio-Ball.png', heigth=200, width=200))
  #   else
  #     tabsetPanel(tabPanel("About file", tableOutput("filedf")),tabPanel("Data", tableOutput("table")),tabPanel("Summary", tableOutput("sum")))
  # })
})

#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
# 1) https://www.youtube.com/watch?v=HPZSunrSo5M
# 2) http://shiny.rstudio.com/tutorial/written-tutorial/lesson3/
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------