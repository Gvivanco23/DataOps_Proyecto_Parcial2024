import os 

## CARPETA DATASET##

location = "C:/Users/USUARIO/Desktop/Proyecto_Parcial/dataset"

#### Validar si existe la carpeta ####
if not os.path.exists(location): ##si no existe la carpeta
  ## creo carpeta   
  os.mkdir(location)
else: ## si la carpeta existe
        for root, dirs, files in os.walk(location,topdown=False):
             for name in files:
                   os.remove(os.path.join(root,name))
             for name in dirs:
                   os.rmdir(os.path(root,name))


####### DESCARGAR DATASET #####

from kaggle.api.kaggle_api_extended import KaggleApi
 

 ### Autenticarnos###
api=KaggleApi() 
api.authenticate()

print(api.dataset_list(search=''))

api.dataset_download_files('youssefismail20/olympic-games-1994-2024', path=location, force=True, quiet=False, unzip=True)
