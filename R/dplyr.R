
## Select
dados2 <- select(dados, processo, distribuicao, orgao_julgador, origem, relator, revisor)


dado3 <- select(dados, 1, 2,7)


dados4 <- dados |>
          select(orgao_julgador, processo)


## Filter

cdc5 <- dados %>% 
         filter(orgao_julgador == " 5ª Câmara de Direito Criminal
")


df <- data.frame(idade = c(45,78,23,90,12),
                 nome = c("José","Pedro","Maria","Patrícia","Flávia"))



                 
df %>% 
  filter(idade <= 50)

df %>% 
   filter(idade >= 50)

## Arrange

cjsg <- cjsg %>% 
       arrange(data_julgamento)

cjsg <- cjsg %>% 
       arrange(desc(data_julgamento))

## Count

cjsg %>% 
    count(orgao_julgador)


orgao <-cjsg %>% 
  count(orgao_julgador, sort = TRUE)


## mutate

cjsg <- cjsg %>% 
      mutate(id = 1:3600)

cjsg <- cjsg %>% 
     mutate(id = NULL)

cjsg <-cjsg %>% 
    mutate(id = 1:3600, .before = 1)

library(lubridate)

cjsg <- cjsg %>% 
        mutate(ano_julgamento = year(data_julgamento), .after = data_julgamento) %>% 
        mutate(mes_julgamento = month(data_julgamento, label = TRUE, abbr = FALSE), .after = ano_julgamento) %>% 
        mutate(dia_julgamento = wday(data_julgamento, label = TRUE, abbr = FALSE), .after = mes_julgamento)
  

cjsg %>% 
  count(ano_julgamento, sort = TRUE) %>% 
  View()


cjsg %>% 
   count(mes_julgamento, sort = TRUE) %>% 
    View()

cjsg %>% 
   count(dia_julgamento, sort = TRUE) %>% 
   View()

## inner_join

df1 <- inner_join(cdc5, cjsg, by = "processo")


## left_join

df2 <- left_join(cdc5, cjsg, by = "processo")


## right_join

df3 <- right_join(cdc5, cjsg, by = "processo")

## full_join

## semi_join

## anti_join

## Separate

dados  <- dados %>% 
       separate(origem, into = c("comarca","foro","vara"), sep = " / ", remove = FALSE, extra = "merge")




