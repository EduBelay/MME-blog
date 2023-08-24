##  Pasos previos
1. Instalar Python  :  ```winget install python```
2. Instalar ffmpeg :  ```winget install ffmpeg```




## Cómo instalar Anaconda y Demucs


Para instalar Anaconda y Demucs, puedes seguir los siguientes pasos:

1. **Descargar Anaconda:**
   - Ve al sitio web oficial de Anaconda en [https://www.anaconda.com/products/individual](https://www.anaconda.com/products/individual).
   - Descarga el instalador correspondiente a tu sistema operativo (Windows, macOS o Linux).
   - Asegúrate de elegir la versión de Anaconda adecuada (Python 3.x) para tu sistema.

2. **Instalar Anaconda:**
   - Ejecuta el instalador de Anaconda que descargaste.
   - Sigue las instrucciones del instalador y acepta los términos y condiciones.
   - Durante la instalación, puedes elegir la ubicación de instalación y si deseas que Anaconda se agregue al PATH del sistema (recomendado).

3. **Crear un entorno virtual:**
   - Abre una terminal o el Anaconda Prompt (en Windows) desde el menú de inicio.
   - Ejecuta el siguiente comando para crear un nuevo entorno virtual llamado "demucs" (puedes cambiar el nombre si lo deseas):
     ``` 
     conda create -n demucs python=3.7
     ```

4. **Activar el entorno virtual:**
   - En la misma terminal o Anaconda Prompt, ejecuta el siguiente comando para activar el entorno virtual:
     - En Windows:
       ```
       conda activate demucs
       ```
     - En macOS y Linux:
       ```
       source activate demucs
       ```

5. **Instalar Demucs:**
   - Ejecuta el siguiente comando para instalar Demucs dentro del entorno virtual activado:
     ```
     pip install demucs
     ```

6. **Ejecutar Demucs:**
   - Puedes ejecutar Demucs desde la terminal o Anaconda Prompt con el entorno virtual activado. Asegúrate de estar en la ubicación correcta donde tienes tus archivos de audio.
   - Utiliza el siguiente comando para separar fuentes de audio utilizando Demucs:
     ```
     demucs [ruta_del_archivo_de_audio]
     ```
     Reemplaza `[ruta_del_archivo_de_audio]` con la ubicación y el nombre del archivo de audio que deseas separar.

Con estos pasos, deberías poder instalar Anaconda y Demucs correctamente y ejecutar Demucs para separar las fuentes de audio deseadas.


## Ejemplos de uso

 ```bash 
# Ayuda 
demucs --help

# separaría las fuentes de voz principal y acompañamiento musical
demucs -s vocals,accompaniment [ruta_del_archivo_de_audio]

 #  Extrae 
demucs -s accompaniment,drums,bass,other 01.mp3
 ```