mifunction <- function(url){
  getwd()
  setwd('C:/Users/HP/Documents/Wrangling_R/proyecto')
  
  library(tidyverse)
  library(rvest)
  library(robotstxt)
  
  #Esto de abajo es para generar el nombre del archivo, que va a contener la fecha del día, nombre del diario y la extensión txt
  #El objeto que contendrá el nombre del archivo es nombre_extension.
  
  fecha <- Sys.Date() 
  fecha <- as.character(fecha)
  pref <- "_"
  fecha_arch <- str_c(pref, fecha)
  extension <- ".txt"
  
  diarios <- read_html(url)#leo la url del diario y la paso a un objeto llamado diarios
  
  nombre <- as.character(url)
  nombre <- str_remove(nombre, "https://www.")
  nombre <- str_remove(nombre, ".com.uy/")
  
  nombre_extension <- str_c(nombre, fecha_arch, extension)
  nombre_extension
  
  #Voy obteniendo los titulares de los diarios, hay varios tipos de estructura por eso son varios nodos, eso es porque cada diario no está
  #estructurado exactamente igual. En algunos casos tuve que usar la funcion str_trim para quitar los espacios inciales y finales de los titulares
  
  diarios %>%
    html_nodes(".article-details h1 a") %>%
    html_text() -> titular_1
  
  diarios %>%
    html_nodes(".article-details h2 a") %>%
    html_text() -> titular_2
  
  diarios %>%
    html_nodes(".content h2 a") %>%
    html_text() -> titular_3
  for (i in seq_along(titular_3)) {
    str_trim(titular_3[i]) -> titular_3[i] 
  }
  
  titular_3#la republica
  
  diarios %>%
    html_nodes(".contenedor_texto h2 a") %>%
    html_text() -> titular_4
  for (i in seq_along(titular_4)) {
    str_trim(titular_4[i]) -> titular_4[i] 
  }
  
  titular_4#el observador
  
  diarios %>%
    html_nodes(".ld-card__body h1 a") %>%
    html_text() -> titular_6
  
  diarios %>%
    html_nodes(".ld-card__body h2 a") %>%
    html_text() -> titular_7
  
  diarios %>%
    html_nodes(".ld-card__body h3 a") %>%
    html_text() -> titular_8
  
  #Acá genero el objeto que tendrá los titulares, algunos de esos titulares_x están vacios pero otros tendrán la info
  #correspondiente a cada diario
  
  titulares <- c(fecha, titular_1, titular_2, titular_3, titular_4, titular_6,
                 titular_7, titular_8)
  
  #Acá genero un archivo tipo tibble y luego lo guardo en la pc
  
  x <- as_tibble(titulares)
  write.table(x, file = nombre_extension)
  #x_titulares <- read.table(nombre_extension, header = TRUE)
  #x_titulares <- as_tibble(x_titulares)
  
}

funcion_titulares <- function() {
  #Esta funcion (funcion_titulares) permite usar la funcion anterior (mifunction) e ir pasandola por cada pagina web correspondiente a cada diario
  #A veces cuando pasa por el diario republica se corta pero si se pasa nuevamente funciona no tengo claro por qué sucede esto. 
 
  url <- c("https://www.elobservador.com.uy/", "https://www.montevideo.com.uy/",
           "https://www.elpais.com.uy/", "https://www.ladiaria.com.uy/",
           "https://www.republica.com.uy/")
  
  for (i in seq_along(url)) {
    mifunction(url[i])
  }
}

funcion_titulares()
