# Objetos no R

## caracteres

objeto1 <- "pucpr"


objeto2 <- "esta é uma frase"


## inteiro (integer)

objeto3 <- 24L


## numérico (numeric ou double)

objeto4 <- 2.34

## lógico (boolean)


objeto5 <- TRUE

objeto6 <- FALSE


objeto7 <- NA


## datas (date)

objeto8 <- as.Date("2021-01-31")

objeto9 <- as.Date("2020-12-31")


objeto9 - objeto8

as.numeric(objeto8)
as.numeric(objeto9)

## Vetores

nomes  <- c("Maria","João","Fernando","Pedro","Patrícia")

idades <- c(24, 45, 21, 18, 78)

idade*2

## Dataframe

df <- data.frame(nome = nomes, idade = idades)

## Matrizes

vetor <- 1:10

m <- matrix(vetor, ncol = 2)

## Listas

lista <- list(df, m, idade, objeto2)

