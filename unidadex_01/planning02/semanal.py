from reportlab.lib.pagesizes import letter
from reportlab.lib.units import cm
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
from reportlab.lib import colors
from datetime import datetime, timedelta

def crear_tabla_semanal(pdf_filename, fecha_inicio_lunes):
    # Datos para la tabla
    dias_de_semana = ["Luns", "Martes", "Mércores", "Xoves", "Viernes"]

    # Calcular las fechas correspondientes a cada día de la semana
    fechas = [fecha_inicio_lunes + timedelta(days=i) for i in range(5)]

    # Crear una lista de listas con los datos para la tabla
    data = [[dia, fecha.strftime("%d/%m")] for dia, fecha in zip(dias_de_semana, fechas)]

    # Ajustar los márgenes de la página
    margen = 0.5 * cm
    alto_pagina = letter[1] - (2 * margen)
    ancho_pagina = letter[0] - (2 * margen)

    # Crear el documento PDF con márgenes de 0.5 cm en todas las direcciones
    doc = SimpleDocTemplate(pdf_filename, pagesize=(ancho_pagina, alto_pagina), leftMargin=margen, rightMargin=margen, topMargin=margen, bottomMargin=margen)

    # Número de filas en la tabla
    num_filas = len(data)

    # Calcular el alto de fila original para que todas las filas ocupen el alto del folio
    alto_de_fila_original = alto_pagina / num_filas

    # Reducir el alto de fila en un 10%
    alto_de_fila_reducido = alto_de_fila_original * 0.9

    # Ancho predeterminado para la primera columna
    ancho_primera_columna = 100  # Puedes ajustar este valor según tus necesidades

    # Calcular el ancho de la segunda columna para ocupar el máximo espacio disponible
    ancho_segunda_columna = ancho_pagina - ancho_primera_columna

    # Establecer el estilo de la tabla
    table_style = [
        ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#F5F5DC")),  # Color de fondo beige
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.HexColor("#000000")),  # Color de texto negro
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor("#F5F5DC")),  # Color de fondo beige
        ('GRID', (0, 0), (-1, -1), 1, colors.HexColor("#000000")),  # Color de la cuadrícula negro
    ]

    # Crear la tabla y establecer los anchos de columna y alto de fila reducido
    table = Table(data, colWidths=[ancho_primera_columna, ancho_segunda_columna], rowHeights=[alto_de_fila_reducido] * num_filas)
    table.setStyle(TableStyle(table_style))

    # Crear el objeto Story y agregar la tabla
    story = []
    story.append(table)

    # Construir el PDF
    doc.build(story)

    print(f"Se ha creado el archivo PDF: {pdf_filename}")

# Fecha de inicio (lunes) para la tabla
fecha_inicio_lunes = datetime(2023, 9, 18)  # Ejemplo: 18 de septiembre de 2023

# Llamar a la función para crear el PDF
crear_tabla_semanal("tabla_semanal.pdf", fecha_inicio_lunes)
