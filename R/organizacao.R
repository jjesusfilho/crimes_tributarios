library(tidyverse)
library(tjsp)


dados <- dados %>% 
        select(processo, assunto, orgao_julgador, relator, origem)


dados <- dados %>% 
      mutate(camara = NULL)


dados <- dados %>% 
         mutate(camara = str_remove_all(orgao_julgador, "[:lower:]+") %>% str_remove_all("\\s+"))

dispositivo <- dispositivo %>% 
     mutate(decisao = tjsp_classificar_recurso(dispositivo))



dispositivo %>% 
     count(decisao, sort = TRUE) %>% 
     View()

dispositivo <- dispositivo %>% 
         mutate( prescricao = str_detect(dispositivo, "(?i)(prescrição|prescrev|prescricao)"))
    


dispositivo %>% 
    count(decisao, prescricao) %>% 
    View()

partes %>% 
   count(tipo_parte, sort = TRUE) %>% 
   View()

partes <- partes %>% 
          mutate(tipo_parte = str_squish(tipo_parte)) %>% 
          filter(tipo_parte == "Apelante:")


library(vctrs)

partes <- partes %>% 
         select(processo, parte) %>% 
         mutate(repetido = vec_duplicate_detect(processo))

partes <- partes %>% 
         filter(repetido == FALSE) %>% 
         select(processo, parte)


partes %>% 
    count(parte, sort = TRUE) %>% 
    View()

partes <- partes %>% 
          mutate(apelante = case_when(
            str_detect(parte, "(?i)minist[ée]rio") ~ "MP",
            TRUE ~ "réu"
            
          ))

#remotes::install_github("courtsbr/JurisMiner")
  
library(JurisMiner)

mov <- movimentacao %>% 
       tempo_movimentacao(data)

tempo <- mov %>% 
        group_by(processo) %>% 
        summarize(total = max(decorrencia_acumulada))



tempo_dispostivo <- inner_join(dispositivo, tempo, by = "processo")


base <- dados %>% 
       select(processo, camara) %>% 
       filter(str_detect(camara, "CDC$"))
    
base <- tempo_dispostivo %>% 
        select(processo, prescricao, tempo_processo = total) %>% 
        inner_join(base, by = "processo")

base <- dispositivo %>% 
        select(processo, decisao) %>% 
        right_join(base)
        
base <- partes %>% 
        select(processo, apelante) %>% 
        right_join(base)


base <- base %>% 
        filter(str_detect(decisao, "(provido|parcial)")) %>% 
        mutate(decisao = case_when(
          decisao == "parcial" ~ "provido",
          TRUE ~ decisao
          
        ))

base <- base %>% 
      filter(!is.na(apelante))


base %>% 
    count(camara, apelante, decisao, sort = TRUE) %>% 
    View()


remotes::install_github("jjesusfilho/JurisVis")


library(JurisVis)

?gg_decisao


gg_decisao(
  base,
  title = "Decisão do TJSP confore a câmara e o apelante",
  x = camara,
  facet = apelante,
  fill = decisao,
  ordered = TRUE,
  x_label = "Câmara",
  y_label = "Número de decisões",
  legend = "Decisão",
  caption = "Fonte: TJSP"
)
