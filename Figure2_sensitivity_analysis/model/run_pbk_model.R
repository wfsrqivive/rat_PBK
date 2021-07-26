library(tictoc)
library(deSolve)
library(dplyr)
source("./functions/PBKmodel.R")
dose = 1
set.seed(23)
model_results <- read.csv("./input/inputDataFile.csv") %>%
  #slice(90:100)%>%
  group_by(compound)%>%
  sample_n(12) %>%
  mutate(rownr = 1:n()) %>%
  group_by_all()%>%
  do(model(pars = c(BW = 0.25,
                    dose = dose*0.25*.$Fa,
                    Fa = .$Fa,
                    FVad = 0.07, FVbo = 0.0659, FVbr = 0.0052, FVgu = 0.026,	
                    FVhe = 0.0044, FVki = 0.0092, FVli = 0.036, FVlu = 0.0052,		
                    FVmu = 0.488, FVsk = 0.1656, FVsp = 0.0024, FVte = 0.012,                	 
                    FVve = 0.0429, FVar = 0.0215, FVpl = 0.0422, FVrb = 0.0222, 
                    FVre = 0.04572,          	 #
                    QC = 4.8, 
                    FQad = 0.059, FQbo = 0.101, FQbr = 0.014, FQgu = 0.101,     
                    FQhe = 0.04, FQki = 0.145, FQh = 0.242+0.011*0.01, FQlu = 1,	  #+0.101*0.01 
                    FQmu = 0.237, FQsk = 0.051, FQsp = 0.011, FQte = 0.0078, 
                    FQre = 0.1032-0.011*0.01,
                    Kpad = .$Kpad, Kpbo = .$Kpbo, Kpbr = .$Kpbr, Kpgu = .$Kpgu, 
                    Kphe = .$Kphe,  Kpki = .$Kpki,  Kpli = .$Kpli,	Kplu = .$Kplu,	
                    Kpmu = .$Kpmu, Kpsk = .$Kpsk, Kpsp = .$Kpsp,  Kpte = .$Kpmu, 
                    Kpre = .$Kpmu,  	
                    BP = 1, #
                    fup= .$Fup, 
                    fuhep = .$Fuinc, 
                    CLint = .$Clint,
                    CLrenal = 0.08,
                    SF= .$scaling.factor,
                    MW = 1, 
                    Ka = .$Ka), 
           tout  = seq(0, 24, by = 0.1),
           state = c(Aad=0, Abo=0, Abr=0, Agu=0, 
                     Ahe=0, Aki=0, Ali=0, Alu=0, 
                     Amu=0, Ask=0, Asp=0, Ate=0, 
                     Ave=0, Aar=0, Are=0, D= dose*0.25*.$Fa, #
                     AliClearance = 0, AkiClearance = 0)
  ))

write.csv(model_results, "./results/PBKresultsDose1_FQsp1.01.csv") #
