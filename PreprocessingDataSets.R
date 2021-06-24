library(readxl)
LT <- read_excel("/home/juan/Documents/PaperOtoFelipe/20210412_Transformed DB_1414Cases.xlsx", sheet = "Raw LowerTags")
library(tidyr)
disciplines <- LT[1:47]
#Disciplines <- disciplines %>% pivot_longer(!c(ID, Cases_Title, Cases_LowerTags), names_to = "Discipline", values_to = "sum")

library(dplyr)
variable.names(LT)
# Agro = agribiotechnology + agriculture + plant biology + smart farming + Food + Food, agriculture, forestry, water and bio-economy + plant biology + rural environment
Agro <-  LT[c(1:2, 4, 5, 33, 45, 21, 22, 42)]
# Climate = climate action + climate adaptation strategies + climate crisis + Climate, environment, and resources
Climate <- LT[c(1:2, 10:13)]
# Energy = Energy + energy transition + renewable energy
Energy <- LT[c(1:2, 17, 18, 38)]
# Ethics = ai ethics + Ethics + ethics of ai + responsible technology + security
Ethics <- LT[c(1:2, 6, 19, 20, 40, 44)]
# Health = health care + health technology + Health, demography & wellbeing + patient engagement + vaccine hesitancy + vaccines
Health <- LT[c(1:2, 27, 28, 29, 32, 46, 47)]
# Technologies = Artificial intelligence + Digital technologies + emerging technologies + robotics
Technologies <- LT[c(1:2, 7, 14, 16, 41)]
# Education = Education Community + Science education
Education <- LT[c(1:2, 15, 43)]
# Govern = Governance + policy design + public engagement
Govern <- LT[c(1:2, 25, 34, 32)]
