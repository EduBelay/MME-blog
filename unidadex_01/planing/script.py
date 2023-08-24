from reportlab.lib.pagesizes import A4, landscape
from reportlab.lib import colors
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Spacer, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.units import inch
import calendar

# Función para generar la tabla del mes de septiembre de 2023
def generar_tabla_mes():
    # Crear un calendario del mes de septiembre de 2023
    cal = calendar.monthcalendar(2023, 9)

    # Crear la tabla para mostrar el calendario
    tabla = Table(cal, colWidths=40, rowHeights=40)

    # Aplicar estilo a la tabla
    estilo = TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.lightblue),  # Encabezado con fondo azul claro
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),  # Texto del encabezado en color blanco
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),  # Centrar el texto en todas las celdas
        ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),  # Centrar verticalmente el texto en todas las celdas
        ('GRID', (0, 0), (-1, -1), 1, colors.black),  # Agregar bordes a todas las celdas
    ])

    tabla.setStyle(estilo)

    return tabla

# Función para generar el planificador PDF con el calendario de septiembre de 2023
def generar_planificador_pdf(nombre_archivo):
    # Crear el objeto PDF con orientación horizontal (landscape) y tamaño A4
    doc = SimpleDocTemplate(nombre_archivo, pagesize=A4)

    # Obtener el tamaño de la página A4
    ancho_a4, alto_a4 = A4

    # Generar la tabla del mes de septiembre de 2023
    tabla_mes = generar_tabla_mes()

    # Calcular el ancho de la tabla para que ocupe el 90% del ancho de la página A4
    ancho_tabla = ancho_a4 * 0.9

    # Ajustar el tamaño de la tabla
    tabla_mes._argW[0] = ancho_tabla

    # Obtener el nombre del mes en texto
    nombre_mes = calendar.month_name[9]

    # Crear el párrafo con el texto del mes
    estilos = getSampleStyleSheet()
    estilo_texto_mes = estilos['Title']
    texto_mes = Paragraph(nombre_mes, estilo_texto_mes)

    # Agregar la tabla y el texto del mes al PDF y centrarlos en la página
    elementos = [Spacer(1, alto_a4 * 0.05), texto_mes, Spacer(1, alto_a4 * 0.05), tabla_mes]

    # Generar el PDF
    doc.build(elementos)

# Ejemplo de uso
generar_planificador_pdf("calendario_septiembre_2023_A4.pdf")
