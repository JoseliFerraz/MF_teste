#-----------------------------------------------------------------------
# Criando uma pagina para serie Ministerio da Fazenda
#-----------------------------------------------------------------------
# =>  Pacotes
#install.packages("shiny")

#-----------------------------------------------------------------------
# => Resumo : Desenvolvimento do algoritmo
# Codigo simples para carregamento dos dados disponibilizados no site do ministerio 


#-----------------------------------------------------------------------


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
  )
)
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
# 1) https://www.youtube.com/watch?v=HPZSunrSo5M
# 2) http://shiny.rstudio.com/tutorial/written-tutorial/lesson3/
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------