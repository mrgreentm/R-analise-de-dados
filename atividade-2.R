require(car)
require(dplyr)

## lendo o csv
data_imc <- read.csv('imc.csv', sep = ',', dec = ',', encoding = "UTF-8")
data_enem <- read.csv('enem.csv', sep = ',', dec = ',', encoding = "UTF-8")
## mostrar os dados em tabela
View(data_imc)
View(data_enem)

## exibir as variaveis
glimpse(data_imc)
glimpse(data_enem)