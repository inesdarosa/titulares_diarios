import pandas as pd
import os

def base_gral_tit():
    '''Se toman los csv de una carpeta y luego se arma un archivo con todos los csv con la
    función concat'''

    # Con estas tres líneas armo un lista con los nombres de los archivos csv en la carpeta
    # arch_tit_modificados
    arch_mods = r'C:/Users/inesd/Documents/Python Scripts/arch_tit_modificados'
    arch_mods_extension = r".csv"
    archivos_mods_titulares = [_ for _ in os.listdir(arch_mods) if _.endswith(arch_mods_extension)]

    os.chdir('C:/Users/inesd/Documents/Python Scripts/arch_tit_modificados')# me lleva a una ubicación

    # Con el ciclo for y el append armo una lista con los dataframes presentes en el archivo arch_tit_modificados
    todos_los_archivos = []
    for i in range(len(archivos_mods_titulares)):
        todos_los_archivos.append(pd.read_csv(archivos_mods_titulares[i], encoding='iso8859_2'))
    print(todos_los_archivos[0].shape)
    #todos_los_archivos

    result = pd.concat(todos_los_archivos)# Acá junto todos los dataframes en uno solo
    print(result.shape)
    result.to_csv('C:/Users/inesd/Documents/Python Scripts/base_titulares.csv', header=0, encoding='iso8859_2', index=False)
    # Acá lo grabo en el disco con el nombre de base_titulares.csv

base_gral_tit()

result_1 = pd.read_csv('C:/Users/inesd/Documents/Python Scripts/base_titulares_prueba.csv', encoding='iso8859_2')

titul_1 = pd.read_csv('C:/Users/inesd/Documents/Python Scripts/arch_tit_prueba_mod/republica_2022-07-16.csv', header=0, encoding='iso8859_2')
