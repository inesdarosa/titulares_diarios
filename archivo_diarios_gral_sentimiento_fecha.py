import pandas as pd
import os

# Transformo la columna de texto con la fecha en formato fecha

base_sentimiento = pd.read_csv('C:/Users/inesd/Documents/Python Scripts/base_titulares_sentimiento.csv', encoding='iso8859_2')
base_sentimiento.head()

base_sentimiento.fecha = base_sentimiento.fecha.str.replace('"', '')
base_sentimiento.head()

base_sentimiento['fecha'] = pd.to_datetime(base_sentimiento['fecha'])
base_sentimiento.head()
base_sentimiento['fecha'].dtype# el resultado que da pertenece al tipo fecha.

base_sentimiento.to_csv('C:/Users/inesd/Documents/Python Scripts/base_tit_senti_fecha.csv', encoding='iso8859_2', index=False)
