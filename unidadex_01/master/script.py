import pandas as pd
import matplotlib.pyplot as plt

# Cargar datos desde el archivo CSV
data = pd.read_csv('datos.csv')

# Método para generar un gráfico de barras con leyenda y media (opcional) en orientación vertical u horizontal
def generar_grafico_barras(data, columna, titulo, nombre_archivo, mostrar_media=False, orientacion='vertical', texto=None):
    plt.figure(figsize=(10, 6))
    
    # Obtener los valores de la columna
    valores = data[columna].value_counts()
    
    # Invertir los valores si la orientación es vertical
    if orientacion == 'vertical':
        valores = valores.iloc[::-1]
    
    # Generar gráfico de barras
    if orientacion == 'vertical':
        ax = valores.plot(kind='bar')
    elif orientacion == 'horizontal':
        ax = valores.plot(kind='barh')
    else:
        raise ValueError("La orientación debe ser 'vertical' u 'horizontal'.")
        
    plt.title(titulo)
    plt.xlabel('Cantidad')
    plt.ylabel(columna)
    
    if mostrar_media:
        # Calcular la media
        media = valores.mean()
        
        # Agregar línea para representar la media
        if orientacion == 'vertical':
            plt.axhline(y=media, color='red', linestyle='--', label='Media')
        elif orientacion == 'horizontal':
            plt.axvline(x=media, color='red', linestyle='--', label='Media')
    
    # Agregar etiquetas de valores dentro de las barras (vertical) o al lado de las barras (horizontal)
    if orientacion == 'vertical':
        for p in ax.patches:
            ax.annotate(str(p.get_height()), (p.get_x() + p.get_width() / 2, p.get_height()), ha='center', va='bottom')
    elif orientacion == 'horizontal':
        for p in ax.patches:
            ax.annotate(str(p.get_width()), (p.get_width(), p.get_y() + p.get_height() / 2), ha='left', va='center')
    
    if mostrar_media:
        plt.legend()
    
    if texto:
        plt.text(0.5, 0.5, texto, fontsize=12, ha='center', va='center')
    
    plt.tight_layout()
    plt.savefig(nombre_archivo)
    plt.show()

    
# Método para generar un gráfico de pastel con tabla de datos
def generar_grafico_pie(data, columna, titulo, nombre_archivo):
    fig, ax = plt.subplots(2, 1, figsize=(10, 10))
    
    # Gráfico de pastel
    ax[0].pie(data[columna].value_counts(), labels=data[columna].value_counts().index, autopct='%1.1f%%')
    ax[0].set_title(titulo)
    #ax[0].legend()
    
    # Tabla de datos
    counts = data[columna].value_counts()
    table_data = [[f'{key}', f'{counts[key]} ({counts[key]/counts.sum()*100:.1f}%)'] for key in counts.index]
    table = ax[1].table(cellText=table_data,
                      colLabels=['Categoría', 'Cantidad'],
                      loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.scale(1, 1)
    ax[1].axis('off')
    
    plt.tight_layout()
    plt.savefig(nombre_archivo)
    #plt.show()

# Gráfico 1: Distribución por género
generar_grafico_pie(data, 'genero', 'Distribución por género', '01_grafico_genero.png')

# Gráfico 2: Distribución por grupo de edad
generar_grafico_pie(data, 'edad', 'Distribución por grupo de edad', '02_grafico_edad.png')

# Gráfico 3: Distribución por nivel educativo
generar_grafico_pie(data, 'nivel', 'Distribución por nivel educativo', '03_grafico_nivel.png')

# Gráfico 4: Distribución por ocupación
#generar_grafico_pie(data, 'ocupacion', 'Distribución por ocupación', 'grafico_ocupacion.png')
generar_grafico_barras(data, 'ocupacion', 'Distribución por ocupación', '04_grafico_barras_ocupacion.png', orientacion='horizontal')

#Grafico 5: CCAA 
generar_grafico_barras(data, 'CCAA', 'Indique su comunidad autónoma de referencia donde desarrolla o ha desarrollado su labor profesional.', '05_grafico_barras_ccaa.png', orientacion='vertical')

#Grafico 6: ocasiones 
generar_grafico_barras(data, 'Experiencia', '¿En cuántas ocasiones ha tocado en público la Sonata op. 19 de Paul Creston?', '06_ocasion_paul.png', orientacion='vertical')

#Grafico 7: dificultad 
d2  = data[::-1]
 

generar_grafico_barras(d2, 'Dificultad', '¿Cuál considera que es el grado dificultad de la parte de piano de la Sonata op. 19 de Paul Creston?', '07_dificultad.png', mostrar_media=True, orientacion='horizontal')


#Grafico 8: Intervalo 
generar_grafico_barras(data, 'Intervalo', '¿En cuántas ocasiones ha tocado en público la Sonata op. 19 de Paul Creston?', '06_ocasion_paul.png', orientacion='vertical')
