import librosa
import matplotlib.pyplot as plt
import numpy as np

def generar_espectrograma(ruta_archivo):
    # Cargar el archivo de audio
    audio, sr = librosa.load(ruta_archivo)

    # Generar el espectrograma
    espectrograma = librosa.feature.melspectrogram(y=audio, sr=sr, n_fft=2048, hop_length=512)
    espectrograma_dB = librosa.power_to_db(espectrograma, ref=np.max)

    return espectrograma_dB, sr

# Rutas de los archivos de audio MP3
ruta_archivo_mp3_1 = '01.mp3'
ruta_archivo_mp3_2 = '02.mp3'

# Generar el espectrograma para el primer archivo
espectrograma_1, sr = generar_espectrograma(ruta_archivo_mp3_1)

# Generar el espectrograma para el segundo archivo
espectrograma_2, _ = generar_espectrograma(ruta_archivo_mp3_2)

# Visualizar ambos espectrogramas en la misma gráfica
plt.figure(figsize=(12, 8))

# Espectrograma 1
plt.subplot(2, 1, 1)
plt.imshow(espectrograma_1, aspect='auto', origin='lower', cmap='magma')
plt.colorbar(format='%+2.0f dB')
plt.title('Espectrograma 1')

# Espectrograma 2
plt.subplot(2, 1, 2)
plt.imshow(espectrograma_2, aspect='auto', origin='lower', cmap='magma')
plt.colorbar(format='%+2.0f dB')
plt.title('Espectrograma 2')

plt.tight_layout()
plt.show()
