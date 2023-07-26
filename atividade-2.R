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
join_imc_idade <- list(coluna_imc,coluna_idade)
hist(coluna_imc)
hist(coluna_idade)

boxplot(join_imc_idade, names=c("imc","idade"))

## extra - grafico de dispersao
plot(coluna_idade, coluna_imc, pch = 16, col = "blue", 
     xlab = "Idade", ylab = "IMC", main = "Gráfico de Dispersão IMC vs. Idade")


# c) Elaborar análise BIVARIADA, com variáveis dos tipos:
#  i. variáveis qualitativas x qualitativas,
# utilizaremos a database do enem e as colunas TP_SEXO e NO_MUNICIPIO_ESC
coluna_nm_mun <- data_enem$NO_MUNICIPIO_ESC
matriz_frequencias_sm <- table(coluna_nm_mun,coluna_tp_sexo)
# - grafico de barras
par(mfrow = c(1, 1))  # Organiza os gráficos em uma linha com 2 colunas
# coruripe, palmeira dos indios e penedo (vermelho, verde e azul (respectivamente))
barplot(matriz_frequencias_sm, beside = TRUE, col = rainbow(nrow(matriz_frequencias_sm)), main = "Municipio x Sexo", xlab = "Municipio", ylab = "Frequência")

# ii. variáveis qualitativas x quantitativas,
#utilizaremos a data base enem e as colunas sexo nu_nota_mt
# Calcular a média da nota de matemática por sexo
data_enem$NU_NOTA_CN <- as.numeric(data_enem$NU_NOTA_CN)

# Criação do gráfico de barras
barplot(tapply(data_enem$NU_NOTA_CN, data_enem$TP_SEXO, mean),
        col = c("blue", "red"), main = "Média da Nota de Matemática por Sexo",
        xlab = "Sexo", ylab = "Média da Nota de Matemática")


# iii) variáveis quantitativas x quantitativas.
#utilizaremos a base de dados do enem e as colunas nota_matematica e idade
coluna_idade_enem <- data_enem$NU_IDADE
coluna_nota_matematica <- data_enem$NU_NOTA_MT
#- grafico de dispersao
plot(coluna_idade_enem, coluna_nota_matematica, pch = 16, col = "blue", 
     xlab = "Idade", ylab = "IMC", main = "Gráfico de Dispersão Nota MT vs. Idade")