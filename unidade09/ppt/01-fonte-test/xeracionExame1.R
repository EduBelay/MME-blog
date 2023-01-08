## exams ----------------------------------------------------------------------------

## load package
library("exams")


#configuracion exame
miexamen = list(
  "exercises09/09_ATX12VO_01.Rmd",
  "exercises09/09_ATX12VO_02.Rmd", 
  "exercises09/09_ATX12VO_03_nivel_loxico.Rmd", 
  c("exercises09/09_ATX12VO_04_rango_funcionamento.Rmd",
    "exercises09/09_ATX12VO_05_rango_funcionamento.Rmd"),
  c("exercises09/09_ATX12VO_06_rango_funcionamento.Rmd", 
    "exercises09/09_ATX12VO_07_rango_funcionamento.Rmd"),
  c("exercises09/09_ATX12VO_08_VSB.Rmd", 
    "exercises09/09_ATX12VO_09_VSB.Rmd")
)

#xeracion do exame
exams2nops(miexamen, n = 2, dir = "09exames",
           language = "gl", institution = "MME 2022")
#exportar a kahoot
exams2kahoot(miexamen, n=1, dir="kahoot")


exams2nops(miexamen, n = 1, dir = "09exames",
           language = "gl", institution = "MME 2022", solution = "<h4>Solución</h4>")

exams2pdf(miexamen, n=1,
          edir="exercises09",
          template="templates/solution.tex")

# Ver: http://destio.us.es/calvo/Rexams/manual_crearexamenesrexamsrmarkdown.pdfe