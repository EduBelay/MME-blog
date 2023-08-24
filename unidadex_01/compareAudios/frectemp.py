import numpy as np
import matplotlib.pyplot as plt
from pydub import AudioSegment
from pydub.utils import make_chunks

def analizar_frecuencia_tiempo(ruta_archivo):
    # Cargar el archivo de audio MP3
    audio = AudioSegment.from_file(ruta_archivo)

    # Convertir el audio a un arreglo de NumPy
    audio_array = np.array(audio.get_array_of_samples())

    # Obtener la frecuencia de muestreo del audio
    frecuencia_muestreo = audio.frame_rate

    # Obtener la duración total del audio en segundos
    duracion = len(audio) / 1000

    # Dividir el audio en fragmentos de 1 segundo
    fragmentos = make_chunks(audio, 1000)

    # Inicializar listas para almacenar los datos de frecuencia y tiempo
    frecuencias = []
    tiempos = []

    # Analizar cada fragmento de audio
    for fragmento in fragmentos:
        # Obtener el espectro de frecuencia
        espectro = np.fft.fft(fragmento.get_array_of_samples())

        # Obtener las frecuencias correspondientes al espectro
        frecuencias_fragmento = np.fft.fftfreq(len(fragmento), d=1/frecuencia_muestreo)

        # Agregar los datos de frecuencia y tiempo a las listas
        frecuencias.extend(frecuencias_fragmento)
        tiempos.extend(np.linspace(0, duracion, len(frecuencias_fragmento)))

    # Convertir las listas a arreglos de NumPy
    frecuencias = np.array(frecuencias)
    tiempos = np.array(tiempos)

    # Retornar la información relevante para el análisis
    return tiempos, frecuencias

# Rutas de los archivos de audio MP3
ruta_archivo_mp3_1 = '01.mp3'
ruta_archivo_mp3_2 = '02.mp3'

# Analizar el primer archivo de audio
tiempos_1, frecuencias_1 = analizar_frecuencia_tiempo(ruta_archivo_mp3_1)

# Analizar el segundo archivo de audio
tiempos_2, frecuencias_2 = analizar_frecuencia_tiempo(ruta_archivo_mp3_2)

# Visualizar los resultados
plt.figure(figsize=(12, 8))

# Análisis de frecuencia-tiempo del primer archivo
plt.subplot(2, 1, 1)
plt.scatter(tiempos_1, frecuencias_1, s=1)
plt.title('Análisis de Frecuencia-Tiempo - Archivo 1')
plt.xlabel('Tiempo (s)')
plt.ylabel('Frecuencia (Hz)')

# Análisis de frecuencia-tiempo del segundo archivo
plt.subplot(2, 1, 2)
plt.scatter(tiempos_2, frecuencias_2, s=1)
plt.title('Análisis de Frecuencia-Tiempo - Archivo 2')
plt.xlabel('Tiempo (s)')
plt.ylabel('Frecuencia (Hz)')

plt.tight_layout()
plt.show()
