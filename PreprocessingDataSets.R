library(readxl)
LT <- read_excel("/home/juan/Documents/PaperOtoFelipe/RawDataRRI.xlsx", sheet = "Raw LowerTags")
library(tidyr)
disciplines <- LT[1:47]
#Disciplines <- disciplines %>% pivot_longer(!c(ID, Cases_Title, Cases_LowerTags), names_to = "Discipline", values_to = "sum")

library(dplyr)
variable.names(LT)
# Agro = agribiotechnology + agriculture + plant biology + smart farming + Food + Food, agriculture, forestry, water and bio-economy + plant biology + rural environment
Agro <-  LT[c(1:2, 4, 5, 33, 45, 21, 22, 42)]
Agro <- Agro %>% mutate(sum = rowSums(.[3:9])) %>% mutate(agro = ifelse(sum >= 1, 1, 0))
Agro <- Agro[c(1,2,11)]
# Business & Industry
Business <- LT[c(1:2, 8)]
Business <- Business %>% mutate(sum = Business$`Business & Industry`*1) %>% mutate(busi = ifelse(sum >= 1, 1, 0))
Business <- Business[c(1,2,5)]
# Climate = climate action + climate adaptation strategies + climate crisis + Climate, environment, and resources
Climate <- LT[c(1:2, 10:13)]
Climate <- Climate %>% mutate(sum = rowSums(.[3:6])) %>% mutate(climate = ifelse(sum >= 1, 1, 0))
Climate <- Climate[c(1,2,8)]
# Energy = Energy + energy transition + renewable energy
Energy <- LT[c(1:2, 17, 18, 38)]
Energy <- Energy %>% mutate(sum = rowSums(.[3:5])) %>% mutate(energy = ifelse(sum >= 1, 1, 0))
Energy <- Energy[c(1,2,7)]
# Ethics = ai ethics + Ethics + ethics of ai + responsible technology + security
Ethics <- LT[c(1:2, 6, 19, 20, 40, 44)]
Ethics <- Ethics %>% mutate(sum = rowSums(.[3:7])) %>% mutate(ethics = ifelse(sum >= 1, 1, 0))
Ethics <- Ethics[c(1,2,9)]
# Health = health care + health technology + Health, demography & wellbeing + patient engagement + vaccine hesitancy + vaccines
Health <- LT[c(1:2, 27, 28, 29, 32, 46, 47)]
Health <- Health %>% mutate(sum = rowSums(.[3:8])) %>% mutate(health = ifelse(sum >= 1, 1, 0))
Health <- Health[c(1,2,10)]
# Policy-Makers == 1
PM <- LT[c(1:2, 35)]
PM <- PM %>% mutate(sum = PM$`Policy Makers`*1) %>% mutate(policy = ifelse(sum >= 1, 1, 0))
PM <- PM[c(1:2,5)]
# Technologies = Artificial intelligence + Digital technologies + emerging technologies + robotics
Technologies <- LT[c(1:2, 7, 14, 16, 41)]
Technologies <- Technologies %>% mutate(sum = rowSums(.[3:6])) %>% mutate(technologies = ifelse(sum >= 1, 1, 0))
Technologies <- Technologies[c(1,2,8)]
# Education = Education Community + Science education
Education <- LT[c(1:2, 15, 43)]
Education <- Education %>% mutate(sum = rowSums(.[3:4])) %>% mutate(education = ifelse(sum >= 1, 1, 0))
Education <- Education[c(1,2,6)]
# Govern = Governance + policy design + public engagement
Govern <- LT[c(1:2, 25, 34, 32)]
Govern <- Govern %>% mutate(sum = rowSums(.[3:5])) %>% mutate(govern = ifelse(sum >= 1, 1, 0))
Govern <- Govern[c(1,2,7)]
# Civil Society
CivSoc <- LT[c(1:2, 9)]
CivSoc <- CivSoc %>% mutate(sum = rowSums(.[3])) %>% mutate(civsoc = ifelse(sum >= 1, 1, 0))
CivSoc <- CivSoc[c(1,2,5)]
Disciplines <- list(Agro, CivSoc, Climate, Education, Energy, Ethics, Govern, Health, Technologies)
rm(list=setdiff(ls(), "Disciplines"))
Disciplines <- do.call(cbind.data.frame, Disciplines)
variable.names(Disciplines)
Disciplines <- Disciplines[c(3, 6,9,12,15,18,21,24,27)]
