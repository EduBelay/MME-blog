from fpdf import FPDF, XPos, YPos
import calendar

class PDF(FPDF):
    def header(self):
        self.set_font('Helvetica', 'B', 12)
        self.cell(0, 10, self.mes_ano, 0, new_x=XPos.LMARGIN, new_y=YPos.NEXT, align='C')

    def footer(self):
        self.set_y(-15)
        self.set_font('Helvetica', 'I', 8)
        self.cell(0, 10, 'Páxina ' + str(self.page_no()), 0, new_x=XPos.RIGHT, new_y=YPos.TOP, align='C')

def xerar_planificador(pdf, mes, ano):
    # Nomes dos meses en galego
    meses_galego = ["", "Xaneiro", "Febreiro", "Marzo", "Abril", "Maio", "Xuño", "Xullo", "Agosto", "Setembro", "Outubro", "Novembro", "Decembro"]
    
    pdf.mes_ano = f"{meses_galego[mes]} {ano}"  # Usar o nome do mes en galego
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=15)
    pdf.set_font('Helvetica', size=12)

    dias_mes = calendar.monthrange(ano, mes)[1]  # Obter o número de días do mes

    cell_width = 210 / 7  # Ancho da páxina A4 dividido por 7 días
    header_height = 10  # Altura axustada ao texto para os días da semana
    cell_height = (297 - 50 - header_height) / 6

    # Encabezado dos días
    dias = ["Luns", "Martes", "Mércores", "Xoves", "Venres", "Sábado", "Domingo"]
    for dia in dias:
        pdf.cell(cell_width, header_height, dia, 1)
    pdf.ln()

    # Encher os días do mes
    for i in range(1, dias_mes + 1):
        pdf.cell(cell_width, cell_height, str(i), 1)
        if i % 7 == 0:  # Se é domingo, ir á seguinte liña
            pdf.ln()

if __name__ == "__main__":
    pdf = PDF()
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
