#-----------------------------------------------------------------------
# Construcao do algoritmo para atualizacao da serie MF
# 
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
dados=read.csv2("3-mar17.csv")
dados=read.csv2("notjun18.csv")
notjun18 <- read.csv("//srjn3/area_corporativa/Projeto_IPEADATA/temporario/Joseli/MF/Minha_Pagina/notjun18.csv",col_names = FALSE)
dados=notjun18
head(dados)
str(dados)

#--------------------------------
# Para leitura arquivi excel
library(readxl)
#--------------------------------
X6_jun18 <- read_excel("//srjn3/area_corporativa/Projeto_IPEADATA/temporario/Joseli/MF/Joseli/Dados/2018/6-jun18.xlsx", 
                       col_names = FALSE)
View(X6_jun18)
dados=X6_jun18
head(dados)
str(dados[10,2])
names(dados)
colnames(dados)=c("nomes","mesatual","mesaterior","anoanterior","variacao1","variacao2");names(dados)
# Fixar todas as casas decimais dos dados
options(digits=17)

#-----------------------------------------------------------------------
# Area de teste
#Receitas=dados$X

# Receitas=read.csv2("nomes.csv")
# length(dados$X[3:40])
# Receitas

#write.csv2(Receitas,"nomes.csv",row.names = T)
#cbind(dados,Receitas)
#-----------------------------------------------------------------------


# n=length(dados$nomes)
# for(i in 8:n){ 
#   if((dados$nomes[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
#      (dados$nomes[i]=="OUTRAS RECEITAS ADMINISTRADAS")){ #dados$X[i]=="CONTRIBUI??O PARA O FUNDAF")|(
#    
#      # Mes anterior
#     #a=dados$X.2[which(dados$X=="CONTRIBUI??O PARA O FUNDAF")]
#     b=dados$mesaterior[which(dados$nomes=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
#     c=dados$mesaterior[which(dados$nomes=="OUTRAS RECEITAS ADMINISTRADAS")]
#     if((dados$nomes[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
#        (dados$nomes[i]=="OUTRAS RECEITAS ADMINISTRADAS")){#dados$X[i]=="CONTRIBUI??O PARA O FUNDAF")|(
#       
#     # Mes Atual
#     #d=dados$X.1[which(dados$X=="CONTRIBUI??O PARA O FUNDAF")]
#     e=dados$mesatual[which(dados$nomes=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
#     f=dados$mesatual[which(dados$nomes=="OUTRAS RECEITAS ADMINISTRADAS")]
#    }
#   }
# }


# Para excel
n=length(dados$X0)
for(i in 9:n){ 
  if((dados$X0[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
     (dados$X0[i]=="OUTRAS RECEITAS ADMINISTRADAS")){ #dados$X[i]=="CONTRIBUI??O PARA O FUNDAF")|(
    
    # Mes anterior
    #a=dados$X.2[which(dados$X=="CONTRIBUI??O PARA O FUNDAF")]
    b=dados$X2[which(dados$X=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
    c=dados$X2[which(dados$X=="OUTRAS RECEITAS ADMINISTRADAS")]
    if((dados$X0[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
       (dados$X0[i]=="OUTRAS RECEITAS ADMINISTRADAS")){#dados$X[i]=="CONTRIBUI??O PARA O FUNDAF")|(
      
      # Mes Atual
      #d=dados$X.1[which(dados$X=="CONTRIBUI??O PARA O FUNDAF")]
      e=dados$X1[which(dados$X=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
      f=dados$X1[which(dados$X=="OUTRAS RECEITAS ADMINISTRADAS")]
    }
  }
}



# Armazenando e alterando os formatos dos dados
# Esses dados nao esta sendo fornecidos pelo Ministerio : observar caso retornem , deve-se retirar os comentarios
# a=as.numeric(a);d=as.numeric(d)


b=as.numeric(b)
c=as.numeric(c)

e=as.numeric(e)
f=as.numeric(f)

# Criando a variavel soma e armazenando  
mes_anterior=as.numeric(sum(b+c))
mes_atual=as.numeric(sum(e+f))

# Eliminando colunas nao utilizadas
dados=dados[-c(1,2,3,4,5,18,19,28,29,31,32,34,35,37,38,39,40),-5:-6]

# Data frame para a soma dos meses
soma=data.frame(0,mes_atual,mes_anterior,0);names(soma)<-c("nomes","mesatual","mesaterior","anoanterior")

# Adicionando os resultados ao banco principal
dados=data.frame(rbind(as.matrix(dados),as.matrix(soma)))

# Salvando a atualizacao da serie : observe que deve-se inserir o nome.csv do mes de referencia
write.csv2(dados,"Atualizacao.csv")

