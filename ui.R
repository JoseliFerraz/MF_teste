#-----------------------------------------------------------------------
# Criando uma pagina para serie Ministerio da Fazenda
#-----------------------------------------------------------------------
# =>  Pacotes
#install.packages("shiny")

#-----------------------------------------------------------------------
# => Resumo : desenvolvimento do algoritmo
# Codigo simples para carregamento dos dados disponibilizados no site do ministerio 


#-----------------------------------------------------------------------

# # library(shiny)
# # 
# # # Define UI ----
# ui <- fluidPage(
#   titlePanel("Atualização da série Ministerio da Fazenda"),
#   
#   fluidRow(
#     
#     column(3,
#            fileInput("file", h4("Selecione o arquivo"))),
#     
#     
#     column(3,
#            h4("Botoes "),
#             br(),
#             submitButton("Carregamento")),
#     
#     sidebarPanel(
#     # mainPanel(
#       dataTableOutput("file"))
#       
#       
#     )
#     
#   )
# 
# # Define server logic ----
# server <- function(input, output) {
#   
# }
# 
# # Run the app ----
# shinyApp(ui = ui, server = server)
#-----------------------------------------------------------------------
library(shiny)
shinyUI(fluidPage(
  
  # Titulo da pagina
  titlePanel("Atualizacao da serie Ministerio da Fazenda"),
   
  # Tipo layout da pagina
  sidebarLayout(
   
    # designer da caixa de itens
      sidebarPanel(
     
        # inserindo arquivo
         fileInput("file","Arquivo csv"), # fileinput() function is used to get the file upload contorl option
          
         # Cometario para tamanho do arquivo 
          helpText("Default max. file size is 5MB"),
      
         tags$hr(),
      
         h5(helpText("Select the read.table parameters below")),
         
         # Selecao para default do arquivo
         checkboxInput(inputId = 'header', label = 'Header', value = FALSE),
      
         checkboxInput(inputId = "stringAsFactors", "stringAsFactors", FALSE),
      
         br(), #Comma=','
      
         radioButtons(inputId = 'sep', label = 'Separator', choices = c(Semicolon=';',Tab='\t', Space=''), selected = ','),
      
         # Botao para execucao do algoritmo de rotina MF
         submitButton("Submit")
      ),
      # Painel para visualizacao dos dados
    mainPanel(
      uiOutput("tb")
      
      # use below code if you want the tabset programming in the main panel. If so, then tabset will appear when the app loads for the first time.
      #       tabsetPanel(tabPanel("Summary", verbatimTextOutput("sum")),
      #                   tabPanel("Data", tableOutput("table")))
     )
    )
))
