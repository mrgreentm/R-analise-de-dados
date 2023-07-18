require(car)
require(dplyr)

## carregando base de dados (o csv)
data <- read.csv('mtcars.csv', sep = ';', dec = ',', encoding = "UTF-8")

## mostrar os dados em tabela
View(data)

## exibir as variaveis
glimpse(data)

## A) Com a coluna mpg que consta na base, calcular: mínimo e o máximo valor, média,
## mediana, desvio padrão, os quartis, construir o histograma e o boxplot e interpretar
## os resultados.


## pegando valor maximo da coluna mpg
coluna_mpg <- data$mpg
maximo <- max(coluna_mpg)
maximo

## pegando o valor mínimo da coluna mpg
minimo <- min(coluna_mpg)
minimo

## calculando a média da coluna mpg
media <- mean(coluna_mpg)
media

## calculando a mediana da coluna mpg
mediana <- median(coluna_mpg)
mediana

## calculando o desvio padrao da coluna mpg
desvio_padrao <- sd(coluna_mpg)
desvio_padrao

## calculando os quartis da coluna mpg
quartis <- quantile(coluna_mpg, c(0.25, 0.5, 0.75))
quartis

## construindo o histograma da coluna mpg
hist(coluna_mpg)

## construindo o boxplot da coluna mpg
boxplot(coluna_mpg)



## B) Gerar um gráfico boxplot com as colunas disp e hp.
coluna_disp <- data$disp
coluna_hp <- data$hp
  ### juntando as colunas
join_disp_hp <- list(coluna_hp,coluna_disp)
boxplot(join_disp_hp, names = c("hp","disp"))



## C) Com a coluna qsec, agrupe os dados em seus respectivos quartis, construir tabela
## com as frequências absolutas e relativas e suas respectivas acumuladas. Gerar o
## histograma e comentar o resultado obtido.
coluna_qsec <- data$qsec
  ## agrupando seus quartis
  quartis_qsec <- quantile(coluna_qsec, c(0.25, 0.5, 0.75))
  ### calculando a frequencia absoluta da coluna qsec
  frequencia_abs_qsec <- table(coluna_qsec)
  frequencia_abs_qsec
  ### calculando a frequencia relativa da coluna qsec
  frequencia_rel_qsec <- prop.table(frequencia_abs_qsec)
  frequencia_rel_qsec
  ### construindo a tabela com a frequencia absoluta e a frequencia relativa
  tabela_frequencias <- data.frame(Frequencia_Absoluta = frequencia_abs_qsec, Frequencia_Relativa = frequencia_rel_qsec)
  tabela_frequencias
  
  ### calculando as frequências absolutas acumuladas e as frequências relativas acumuladas
  frequencia_absoluta_acumulada <- cumsum(frequencia_abs_qsec)
  frequencia_absoluta_acumulada
  frequencia_relativa_acumulada <- prop.table(frequencia_absoluta_acumulada)
  frequencia_relativa_acumulada
  
  ## gerando o histograma
  hist(coluna_qsec)
  
  ## d) Com a coluna hp, gerar um histograma, e elaborar uma tabela de frequência usando
  ## as classes sugeridas pelo histograma.
  