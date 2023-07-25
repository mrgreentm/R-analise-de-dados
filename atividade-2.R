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

# a) Com algumas variáveis QUALITATIVAS, elaborar gráficos de barras e comentar
# os resultados.
# utilizaremos TP_SEXO e TP_LINGUA
coluna_tp_sexo <- data_enem$TP_SEXO
coluna_tp_lingua <- data_enem$TP_LINGUA
matriz_frequencias <- table(coluna_tp_sexo, coluna_tp_lingua)
# Passo 2: Criar os gráficos de barras sexo x lingua
par(mfrow = c(1, 2))  # Organiza os gráficos em uma linha com 2 colunas
barplot(matriz_frequencias, beside = TRUE, legend.text = TRUE, col = rainbow(nrow(matriz_frequencias)), main = "Sexo x Lingua", xlab = "Linguas", ylab = "Frequência")
# percebe-se que,os que escolhem a lingua estrangeira ESPANHOL, sao em grande maioria, mulheres
# por outro lado, dentre os que escolhem inglês, mulheres e homens são quase que iguais em número, tendo as mulheres pequena maioria

# b) Com algumas variáveis QUANTITATIVAS, elaborar histograma e boxplot e
# comentar e interpretar os resultados com relação a assimetria dos dados.
# utilizaremos a tabela imc com as colunas IMC e IDADE
coluna_imc <- data_imc$IMC
coluna_idade <- data_imc$Idade
## juntando colunas
join_imc_idade <- c(coluna_imc,coluna_idade)
hist(join_imc_idade)

