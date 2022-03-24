library(tidyverse)


## Dplyr

1. select
2. filter
3. arrange
4. count
5. summarize
6. mutate
7. group_by
8. família join
9. case_when

## Tidyr
1. separate
2. unite
3. pivot_wider
4. pivot_longer

## Stringr


paste("Universidade", "de", "São", "Paulo")


paste("Universidade", "de", "São", "Paulo", sep = "_")




str_c("Que", "a", "Força", "esteja", "com", "você")

str_c("Que", "a", "Força", "esteja", "com", "você", sep="_")

str_length("força")


cnj <- "00001208120158260466"

sequencial <- str_sub(cnj, 1,7)

digito <- str_sub(cnj, 8,9)
digito

ano <- str_sub(cnj, 10, 13)
segmento <- str_sub(cnj, 14,14)
tribunal <- str_sub(cnj, 15,16)
distribuidor <- str_sub(cnj, 17, 20)

## str_trim

str_trim(' curso de jurimetria \n    ')

str_squish(" curso de \n jurimetria\n na pucpr    ")


dados <- cposg %>% 
       mutate(orgao_julgador = str_squish(orgao_julgador))

cdc5 <- dados %>% 
     filter(orgao_julgador == "5ª Câmara de Direito Criminal")


df <- data.frame(nome = c("Maria", "Patrícia","Flávia","José", "João"),
                 idade = c(12,34,17, 47, 25))


df <- df %>% 
    mutate(faixa = case_when(
      
      idade < 12 ~ "criança",
      idade < 18 ~ "adolescente",
      idade >= 18 ~ "adulto",
      idade >  59 ~ "idoso"
  
    ))


endereco <- c("Avenida Paulista, 458, apto 1070, cep 015000-000, município de São Paulo, estado de são Paulo",
              "rua Padrão, 658, cep 012000-017, Sao Paulo, estado de Sao paulo")

## str_extract

str_extract(endereco, "\\d") ## primeiro número

str_extract(endereco, "\\d+") ## primeria sequência

str_extract_all(endereco, "\\d+")


str_extract(endereco, '[\\w\\s]+')

## str_replace

str_replace(endereco, ",", ", número")


str_replace_all(endereco,",",'.')

str_replace(endereco, "-","")

str_remove(endereco, "-")

str_remove_all(endereco,",")


## str_detect

str_detect(endereco,"Paulo")


str_detect(endereco, "Rua")

str_detect(endereco, "(?i)Rua")



## Lookbehind

str_extract(endereco, "(?<=cep )[\\d-]+")


## Lookahead

str_extract(endereco, "\\d{5}-\\d{3}(?=,)")




destaque <- "Amélia*"

str_extract(destaque, "*")

str_extract(destaque, "\\*")


str_extract("direito 4.0", ".")

str_extract("direito 4.0", "\\d+\\.\\d+")

