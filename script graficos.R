### Análisis de datos para trabajo final perú
### por : sandro peirano

# Inicializar paquetes, data frames iniciales y archivos-------------------------------------------------------------------------
getwd()
setwd("/home/elaepaulistana/R")
library(tidyverse)
library(forcats)

datos <- read.csv("perudatos2.csv")
colnames(datos) <- c("Año","Cajamarca","Cifra Nacional","Huánuco","Pasco","Junín","Huancavelica","Ayacucho","Apurimac","Cuzco","Puno","Lima Provincias","Arequipa")
datos <- gather(datos, Cajamarca:Arequipa, key = "Area", value = "IDH")
View(datos)

## Gráficos----------------------------------------------------------------------------------------------------------------------
ggplot(filter(datos, Area!="Cifra Nacional"))
graf <- ggplot(datos) + 
 geom_point(aes(x = Año, y = IDH, color = Area), size = 1.5) +
  scale_y_continuous(breaks = c(0.10, 0.20, 0.30, 0.35, 0.40, 0.50, 0.60, 0.70)) +
  scale_x_continuous(breaks = c(2003, 2005, 2007, 2009, 2011, 2013, 2015))
  #geom_point(data = filter(datos, Provincia == "Perú"), aes(x = Año, y = IDH), size = 2, color = "black")
graf + geom_line(aes(x = Año, y = IDH, color = Area)) +
  ggtitle("Indice de Desarrollo Humano (IDH)") +
labs(subtitle = "Provincias localizadas en la Sierra del Perú")
#theme(plot.title = element_text(lineheight=.8, face="bold"))
