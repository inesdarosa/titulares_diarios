# titulares_diarios
código para bajar titulares de diarios y guardar en archivos txt

En este conjunto de archivos se encuentran los pasos que seguí para bajar los títulos presentes en 5 páginas de noticias del Uruguay.
El archivo funcion_titulares.R toma los títulos por página de diarios y los guarda como txt, obteniendo 5 archivos txt, uno por diario.
El archivo archivos_diarios_1.py toma cada archivo txt luego de un conjunto de modificaciones lo convierte en un csv guardando esos archivos con un nombre diferente
en otra carpeta.
El archivo archivos_diarios_gral.py toma todos los csv anteriores y arma un único csv.
El archivo archivo_diarios_gral_sentimiento_fecha.py es un csv que proviene del csv anterior que le fue agregado una columna con el 'sentimiento' (esto todavía hay
que explicarlo) y además se le formateó los datos de fechas con formato fecha, en la columna de fecha.



