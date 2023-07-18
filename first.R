require(car)
library(dplyr)

# carregando o banco de dados
data <- read.csv('bd.csv', sep = ';', dec = ',', encoding = "UTF-8")
View(data)
glimpse(data)


### Ajustando  variaveis

# transformando genero em fator
# estamos transformando 0 em M e 1 em F
data$Genero <- factor(data$Genero, label = c("M", "F"), levels = c(0,1))