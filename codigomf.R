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

teste=as.numeric(dados[10,2])
#-----------------------------------------------------------------------
# Area de teste
#Receitas=dados$X

# Receitas=read.csv2("nomes.csv")
# length(dados$X[3:40])
# Receitas

#write.csv2(Receitas,"nomes.csv",row.names = T)
#cbind(dados,Receitas)
#-----------------------------------------------------------------------


n=length(dados$X)
for(i in 8:n){ 
  if((dados$X[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
     (dados$X[i]=="OUTRAS RECEITAS ADMINISTRADAS")){ #dados$X[i]=="CONTRIBUI플O PARA O FUNDAF")|(
   
     # Mes anterior
    #a=dados$X.2[which(dados$X=="CONTRIBUI플O PARA O FUNDAF")]
    b=dados$X.2[which(dados$X=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
    c=dados$X.2[which(dados$X=="OUTRAS RECEITAS ADMINISTRADAS")]
    if((dados$X[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
       (dados$X[i]=="OUTRAS RECEITAS ADMINISTRADAS")){#dados$X[i]=="CONTRIBUI플O PARA O FUNDAF")|(
      
    # Mes Atual
    #d=dados$X.1[which(dados$X=="CONTRIBUI플O PARA O FUNDAF")]
    e=dados$X.1[which(dados$X=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
    f=dados$X.1[which(dados$X=="OUTRAS RECEITAS ADMINISTRADAS")]
   }
  }
}


# para excel
n=length(dados$X0)
for(i in 9:n){ 
  if((dados$X0[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
     (dados$X0[i]=="OUTRAS RECEITAS ADMINISTRADAS")){ #dados$X[i]=="CONTRIBUI플O PARA O FUNDAF")|(
    
    # Mes anterior
    #a=dados$X.2[which(dados$X=="CONTRIBUI플O PARA O FUNDAF")]
    b=dados$X2[which(dados$X=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
    c=dados$X2[which(dados$X=="OUTRAS RECEITAS ADMINISTRADAS")]
    if((dados$X0[i]=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")|
       (dados$X0[i]=="OUTRAS RECEITAS ADMINISTRADAS")){#dados$X[i]=="CONTRIBUI플O PARA O FUNDAF")|(
      
      # Mes Atual
      #d=dados$X.1[which(dados$X=="CONTRIBUI플O PARA O FUNDAF")]
      e=dados$X1[which(dados$X=="PSS - CONTRIB. DO PLANO DE SEGURIDADE DO SERVIDOR")]
      f=dados$X1[which(dados$X=="OUTRAS RECEITAS ADMINISTRADAS")]
    }
  }
}



# Armazenando e alterando os formatos dos dados
a=as.numeric(levels(a))[a]
b=as.numeric(levels(b))[b]
c=as.numeric(levels(c))[c]
d=as.numeric(levels(d))[d]
e=as.numeric(levels(e))[e]
f=as.numeric(levels(f))[f]

# Criando a variavel soma e armazenando  
mes_anterior=as.numeric(sum(b+c))
mes_atual=as.numeric(sum(e+f))

# Eliminando colunas nao utilizadas
dados=dados[-c(1,2,3,4,5,18,19,28,29,31,32,34,35,37,38,39,40),-5:-6]

# Data frame para a soma dos meses
soma=data.frame(0,mes_atual,mes_anterior,0);names(soma)<-c("X","X.1","X.2","X.3")

# Adicionando os resultados ao banco principal
dados=data.frame(rbind(as.matrix(dados),as.matrix(soma)))

write.csv2(dados,"Atualizacao.csv")

