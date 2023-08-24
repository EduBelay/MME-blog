import numpy as np
import matplotlib.pyplot as plt
import librosa

def analizar_frecuencia(ruta_archivo):
    # Cargar el archivo de audio MP3
    audio, sr = librosa.load(ruta_archivo)

    # Calcular la transformada de Fourier
    transformada = np.abs(np.fft.fft(audio))
    frecuencias = np.fft.fftfreq(len(audio), 1/sr)

    # Retornar la información relevante para el análisis
    return frecuencias[:len(audio)//2], transformada[:len(audio)//2]

# Rutas de los archivos de audio MP3
ruta_archivo_mp3_1 = '01.mp3'
ruta_archivo_mp3_2 = '02.mp3'

# Analizar el primer archivo de audio
frecuencias_1, transformada_1 = analizar_frecuencia(ruta_archivo_mp3_1)

# Analizar el segundo archivo de audio
frecuencias_2, transformada_2 = analizar_frecuencia(ruta_archivo_mp3_2)

# Visualizar los resultados
plt.figure(figsize=(12, 8))

# Superponer las gráficas de análisis de frecuencia
plt.plot(frecuencias_1, transformada_1, label='Archivo 1')
plt.plot(frecuencias_2, transformada_2, label='Archivo 2')

plt.xlabel('Frecuencia (Hz)')
plt.ylabel('Amplitud')
plt.title('Análisis de Frecuencia - Comparación de Archivos')
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.show()
