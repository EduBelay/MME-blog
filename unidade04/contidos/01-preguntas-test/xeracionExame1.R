## exams ----------------------------------------------------------------------------

## load package
library("exams")
nops_scan()

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
           language = "gl", institution = "MME 2022",logo=file.path(getwd(),"logo.jpg"))
#exportar a kahoot
exams2kahoot(miexamen, n=1, dir="kahoot")



myexam <- c(   "exercises09/09_ATX12VO_01.Rmd",
               "exercises09/09_ATX12VO_02.Rmd",
               "exercises09/09_ATX12VO_03_nivel_loxico.Rmd",
               "exercises09/09_ATX12VO_04_rango_funcionamento.Rmd",
               "exercises09/09_ATX12VO_05_rango_funcionamento.Rmd")

set.seed(403)
exams2nops(myexam, n = 1, language = "gl",
           institution = "IES Antón Losada Dieguez", title = "Exame MME - UD09",
           dir = "UD09_examen_", name = "examen01", date = "2023-05-19", logo=file.path(getwd(),"logo.jpg"))


exams2nops(miexamen, n = 1, dir = "09exames",
           language = "gl", institution = "MME 2022", solution = "<h4>Solución</h4>")


#probas - pdte
exams2pdf(miexamen, n=1,
          dir="exercises09",
          template="templates/solution.tex")

exams.skeleton()

# Ver: http://destio.us.es/calvo/Rexams/manual_crearexamenesrexamsrmarkdown.pdfe
# scan pdf exams
# https://www.rdocumentation.org/packages/exams/versions/2.4-0/topics/nops_scan