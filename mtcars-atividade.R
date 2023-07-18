require(car)
require(dplyr)

## carregando base de dados (o csv)
data <- read.csv('mtcars.csv', sep = ';', dec = ',', encoding = "UTF-8")

## mostrar os dados em tabela
View(data)

## exibir as variaveis
glimpse(data)

## Com a coluna mpg que consta na base, calcular: mínimo e o máximo valor, média,
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

