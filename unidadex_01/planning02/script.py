from fpdf import FPDF, XPos, YPos
import calendar

dias_festivos = {
    1:  [1,2,3,4,5, 6,7,13,14,20,21,27,28], 
    2:  [12,13,14,3,4,10,11,17,18,24,25],   
    3:  [25,26,27,28,29,30,31,2,3,9,10,16,17,23,24],  
    4:  [1,6,7,13,14,20,21,27,28],    
    5:  [1,17,20,4,5,11,12,18,19,25,26], 
    6:  [1,2,8,9,15,16,22,23,29,30], 
    9:  [2,3,9,10,16,17,23,24,30],     
    10: [12,13,1,7,8,14,15,21,22,28,29],    
    11: [1,4,5,11,12,18,19,25,26]     ,
    12: [6,7,8,22,23,24,25,26,27,28,29,30,31,2,3,9,10,16,17]     
 }



# Nombres de los días da semana en galego (RAG)
nombres_dias_gallego = ["Luns", "Martes", "Mércores", "Xoves", "Venres", "Sábado", "Domingo"]

# Diccionario para mapear os nomes dos meses en inglés para galego
meses_galego = {
    "January": "Xaneiro",
    "February": "Febreiro",
    "March": "Marzo",
    "April": "Abril",
    "May": "Maio",
    "June": "Xuño",
    "July": "Xullo",
    "August": "Agosto",
    "September": "Setembro",
    "October": "Outubro",
    "November": "Novembro",
    "December": "Decembro"
}
class PDF(FPDF):
    def header(self):
        self.set_font('Helvetica', 'B', 12)
        self.cell(0, 10, self.mes_ano, 0, new_x=XPos.LMARGIN, new_y=YPos.NEXT, align='C')

    def footer(self):
        self.set_y(-30)
        self.set_font('Helvetica', 'I', 8)
        self.cell(0, 10, 'Departamento de Informática - IES Antón Losada Diéguez', 0, new_x=XPos.CENTER, new_y=YPos.TOP, align='C')

def efemerides_informatica(pdf, mes):
    efemerides = {
        1: ["8: Aniversario do CES 1967", "24: Creación de Macintosh 1984", "27: Nacemento de Ada Lovelace 1815", "30: Lanzamento de Windows Vista 2007"],
        2: ["15: Creación de YouTube 2005", "28: Lanzamento de Raspberry Pi 2012", "12: Nacemento de Radia Perlman 1951", "20: Lanzamento de Steam 2003"],
        3: ["12: Aniversario de World Wide Web 1989", "14: Pi Day", "26: Nacemento de Elaine Weyuker", "31: Lanzamento de GNOME 1.0 1999"],
        4: ["1: Día da broma de April Fools", "4: Aniversario de Gmail 2004", "12: Nacemento de Robert E. Kahn 1938", "26: Nacemento de Joan Clarke 1917"],
        5: ["22: Aniversario de Sinclair ZX Spectrum 1982", "31: Aniversario de Windows 3.1 1992", "5: Nacemento de Mary Lou Jepsen", "24: Lanzamento de Windows 3.0 1990"],
        6: ["5: Aniversario de Apple I 1977", "18: Aniversario de Oracle 1979", "10: Nacemento de Grace Hopper 1906", "26: Lanzamento de IBM 1620 1959"],
        7: ["9: Aniversario de IBM PC 1981", "16: Lanzamento de Apollo 11 1969", "2: Nacemento de Katharine Burr Blodgett 1898", "19: Lanzamento de MS-DOS 1.0 1981"],
        8: ["6: Aniversario de WWW 1991", "24: Lanzamento de Windows 95", "26: Nacemento de Katherine Johnson 1918", "15: Lanzamento de Intel 8080 1974"],
        9: ["4: Google aniversario 1998", "15: Aniversario de .NET Framework 2002", "9: Nacemento de Margaret Hamilton 1936", "30: Lanzamento de OS/2 Warp 1996"],
        10: ["1: Aniversario de Microsoft 1985", "25: Aniversario de iPod 2001", "17: Nacemento de Jean Bartik 1924", "13: Lanzamento de Ubuntu 4.10 2004"],
        11: ["15: Aniversario de Windows 1.0 1985", "20: Aniversario de Xbox 2001", "2: Nacemento de Dorothy Vaughan 1910", "10: Lanzamento de Intel 4004 1971"],
        12: ["10: Aniversario de Python 1989", "28: Aniversario de TCP/IP 1983", "9: Nacemento de Grace Murray Hopper 1906", "25: Lanzamento de Netscape Navigator 1.0 1994"]
    }

    pdf.ln(20)  # Engadir un salto de liña adicional
    pdf.set_font('Helvetica', 'B', 12)
    pdf.cell(0, 10, 'Efemérides Informáticas', 0, new_x=XPos.LMARGIN, new_y=YPos.NEXT, align='C')
    pdf.set_font('Helvetica', '', 10)
    col_width = 297 / 2
    current_col = 0

    for efemeride in efemerides.get(mes, []):
        date, event = efemeride.split(": ")
        pdf.set_font('Helvetica', 'B', 10)
        pdf.cell(15, 10, date + ": ", 0, align='L')
        pdf.set_font('Helvetica', '', 10)
        pdf.cell(col_width - 15, 7, event, 0, align='L')

        if current_col == 0:
            pdf.set_x(col_width)
            current_col = 1
        else:
            pdf.ln(10)
            pdf.set_x(0)
            current_col = 0

            
def xerar_planificador(pdf, mes, ano):
    mes_galego = meses_galego[calendar.month_name[mes]]
    festivos_del_mes = dias_festivos.get(mes, [])

    pdf.mes_ano = f"{mes_galego} {ano}"  # Definir o atributo 'mes_ano' para el encabezado
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=35)  # Aumentar el margen para no solapar con el logotipo
    pdf.set_font('Helvetica', size=12)

    dias_mes = calendar.monthrange(ano, mes)[1]  # Obtener el número de días del mes

    cell_width = 297 / 7  # Ancho de la página A4 apaisado dividido por 7 días
    header_height = 10  # Altura ajustada al texto para los días de la semana
    cell_height = 25 # Reducir el espacio para los días para no solapar con el logotipo

    # Encabezado de los días
    dias = [nombres_dias_gallego[dia] for dia in range(7)]
    for dia in dias:
        pdf.cell(cell_width, header_height, dia, 1)
    pdf.ln()

    # Aquí determinamos en qué día de la semana comienza el mes (0 = Lunes, 1 = Martes, ..., 6 = Domingo)
    dia_inicio_mes = calendar.monthrange(ano, mes)[0]

    # Rellenar las celdas vacías hasta el inicio del mes
    for i in range(dia_inicio_mes):
        pdf.cell(cell_width, cell_height, "", 1)

    # Llenar los días del mes
    for i in range(1, dias_mes + 1):
        # Si el día es festivo, establece el color de relleno a gris
        if i in festivos_del_mes:
            pdf.set_fill_color(200, 200, 200)  # Color gris
            pdf.cell(cell_width, cell_height, str(i), 1, fill=True)
        else:
            pdf.cell(cell_width, cell_height, str(i), 1)
        if (i + dia_inicio_mes) % 7 == 0:  # Si es domingo, ir a la siguiente línea
            pdf.ln()

    #efemerides_informatica(pdf, mes)



if __name__ == "__main__":
    pdf = PDF(orientation='L')  # Establecer a orientación apaisado
    pdf.set_margins(0.4 * 10, 0.4 * 10)  # Establecer os marxes laterais a 0,4 cm (multiplicado por 10 para convertelo a puntos)

    for ano in [2023, 2024]:
        for mes in range(1, 13):
            if ano == 2023 and mes < 9:
                continue
            if ano == 2024 and mes > 7:
                break
            xerar_planificador(pdf, mes, ano)
    
    nome_arquivo = "Planificador_2023-2024.pdf"
    pdf.output(nome_arquivo)
    print(f"Planificador xerado: {nome_arquivo}")
