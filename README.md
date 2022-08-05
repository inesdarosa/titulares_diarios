# titulares_diarios

Código para bajar títulos de diarios on line y se analiza esos título (NLP), particularmente se realiza un análisis de sentimiento utilizando el paquete pysentimiento
(pysentimiento: A Python Toolkit for Sentiment Analysis and SocialNLP tasks. Juan Manuel Pérez, Juan Carlos Giudici, Franco Luque. arXiv:2106.09462 [cs.CL])

En este conjunto de archivos se encuentran los pasos que seguí para bajar los títulos presentes en 5 páginas de noticias del Uruguay y diferentes tratamientos.
El archivo funcion_titulares.R toma los títulos por página de diarios y los guarda como txt, obteniendo 5 archivos txt, uno por diario.
El archivo archivos_diarios_1.py toma cada archivo txt luego de un conjunto de modificaciones lo convierte en un csv guardando esos archivos con un nombre diferente
en otra carpeta.
El archivo archivos_diarios_gral.py toma todos los csv anteriores y arma un único csv.
El archivo .csv único mencionado anteriormente se lo abre en el archivo diario_geral.ipynb y se pasa por un paquete llamdao pysentimiento (NLP).
El paquete pysentimiento etiqueta los títulos como neutrales (NEU), positivos (POS) y negativos (NEG). Luego de etiquetar se arma de forma tentativa un modelo de red
neuronal para etiquetar. Esto último es únicamente a modo de ejercicio ya que no tiene sentido formal ni de utilidad construir esta red usando pysentimiento para
etiquetar ya que sería redundante.
Posteriormente se arma un nuevo archivo incluyendo como columna las etiquetas de sentimientos
El archivo archivo_diarios_gral_sentimiento_fecha.py contiene un csv que incluye la columna con el 'sentimiento' y se formateó los datos de fechas con formato fecha, en
la columna de fecha.



