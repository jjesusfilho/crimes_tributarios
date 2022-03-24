library(tjsp)

classe <- "417"

assuntos <- "3614,50286,50287,50288,50289,50290"
?tjsp_baixar_cjsg


tjsp_baixar_cjsg(
  livre = "",
  aspas = FALSE,
  classe = classe,
  assunto = assuntos,
  orgao_julgador = "",
  inicio = "",
  fim = "",
  inicio_pb = "",
  fim_pb = "",
  tipo = "A",
  n = 20,
  diretorio = "data-raw/cjsg"
)


cjsg <- tjsp_ler_cjsg(diretorio ="data-raw/cjsg")


autenticar()

tjsp_baixar_cposg(cjsg$processo, diretorio = "data-raw/cposg")

arquivos <- list.files("data-raw/cposg",full.names = TRUE)

dados <- ler_dados_cposg(arquivos =  arquivos)

partes <- tjsp_ler_partes(arquivos)

dispositivo <- tjsp_ler_dispositivo(arquivos)

movimentacao <- ler_movimentacao_cposg(arquivos)








