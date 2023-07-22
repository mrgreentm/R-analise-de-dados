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
  quartis_qsec <- quantile(coluna_qsec, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)
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
  hist(coluna_qsec, breaks = quartis_qsec, main = "Histograma dos Quartis de qsec", xlab = "qsec", ylab = "Frequência", col = "lightblue", border = "black")
  
  ## d) Com a coluna hp, gerar um histograma, e elaborar uma tabela de frequência usando
  ## as classes sugeridas pelo histograma.
  
  # Gerando histograma
  coluna_hp <- data$hp
  histograma_hp <- hist(coluna_hp)
  
  # Passo 2: Construir a tabela de frequência usando as classes sugeridas
  classes_sugeridas <- histograma_hp$breaks
  tabela_frequencia <- cut(coluna_hp, breaks = classes_sugeridas, include.lowest = TRUE, labels = FALSE)
  tabela_frequencia <- table(tabela_frequencia)
  print(tabela_frequencia)
  
  
  # e) Com as colunas motor e marcha gerar a matriz com as respectivas frequências,
  # gerar os gráficos de barras motor x marcha e marcha x motor e interpretar os
  # resultados.
  
  # Passo 1: Gerar a matriz de frequências
  coluna_motor <- data$motor
  coluna_marcha <- data$marcha
  matriz_frequencias <- table(coluna_motor, coluna_marcha)
  # Passo 2: Criar os gráficos de barras motor x marcha e marcha x motor
  par(mfrow = c(1, 2))  # Organiza os gráficos em uma linha com 2 colunas
  # Gráfico de barras motor x marcha
  barplot(matriz_frequencias, beside = TRUE, legend.text = TRUE, col = rainbow(nrow(matriz_frequencias)), main = "Motor x Marcha", xlab = "Motor", ylab = "Frequência")
  # Gráfico de barras marcha x motor
  barplot(t(matriz_frequencias), beside = TRUE, legend.text = TRUE, col = rainbow(ncol(matriz_frequencias)), main = "Marcha x Motor", xlab = "Marcha", ylab = "Frequência")
  
  
  
  # f) Escolher duas variáveis (colunas), sendo uma qualitativa e outra quantitativa, gerar
  # gráficos de barras e interpretar os resultados.
  
  # Passo 1: Calcular a média (ou mediana) de hp para cada categoria de marcha
  library(dplyr)
  
  # Usaremos a média como exemplo, mas você também pode usar a mediana (função median())
  media_hp_por_marcha <- data %>%
    group_by(marcha) %>%
    summarize(media_hp = mean(hp))
  
  # Passo 2: Gerar o gráfico de barras
  barplot(media_hp_por_marcha$media_hp, names.arg = media_hp_por_marcha$marcha, col = "lightblue", main = "Média de hp por Marcha", xlab = "Marcha", ylab = "Média de hp")
  
  
  