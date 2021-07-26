library(tidyverse)
dose1 <- read.csv("./model/results/PBKresultsDose1.csv") %>%
  select(compound, rownr, Cplasmavenous, logP, logD, frac.unionized, frac.ionized.acid, frac.ionized.base)
dataClint <- read.csv("./model/results/PBKresultsDose1_CLint1.01.csv") %>%
  select(compound, rownr, Clint,Fuinc,method.Clint,CplasmavenousClint = Cplasmavenous)
dataFup <- read.csv("./model/results/PBKresultsDose1_Fup1.01.csv") %>%
  select(compound, rownr, Fup,CplasmavenousFup = Cplasmavenous)
dataKa<- read.csv("./model/results/PBKresultsDose1_Ka1.01.csv") %>%
  select(compound, rownr, Ka,CplasmavenousKa = Cplasmavenous)
dataFVli<- read.csv("./model/results/PBKresultsDose1_FVli1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVli = Cplasmavenous)
dataBP<- read.csv("./model/results/PBKresultsDose1_BP1.01.csv") %>%
  select(compound, rownr, CplasmavenousBP = Cplasmavenous)
dataFa<- read.csv("./model/results/PBKresultsDose1_Fa1.01.csv") %>%
  select(compound, rownr, Fa,CplasmavenousFa = Cplasmavenous)
dataFVad<- read.csv("./model/results/PBKresultsDose1_FVad1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVad = Cplasmavenous)
dataFVbo<- read.csv("./model/results/PBKresultsDose1_FVbo1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVbo = Cplasmavenous)
dataFVbr<- read.csv("./model/results/PBKresultsDose1_FVbr1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVbr = Cplasmavenous)
dataFVgu<- read.csv("./model/results/PBKresultsDose1_FVgu1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVgu = Cplasmavenous)
dataFVhe<- read.csv("./model/results/PBKresultsDose1_FVhe1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVhe = Cplasmavenous)
dataFVki<- read.csv("./model/results/PBKresultsDose1_FVki1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVki = Cplasmavenous)
dataFVlu<- read.csv("./model/results/PBKresultsDose1_FVlu1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVlu = Cplasmavenous)
dataFVmu<- read.csv("./model/results/PBKresultsDose1_FVmu1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVmu = Cplasmavenous)
dataFVsk<- read.csv("./model/results/PBKresultsDose1_FVsk1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVsk = Cplasmavenous)
dataFVsp<- read.csv("./model/results/PBKresultsDose1_FVsp1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVsp = Cplasmavenous)
dataFVte<- read.csv("./model/results/PBKresultsDose1_FVte1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVte = Cplasmavenous)
dataFVve<- read.csv("./model/results/PBKresultsDose1_FVve1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVve = Cplasmavenous)
dataFVar<- read.csv("./model/results/PBKresultsDose1_FVar1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVar = Cplasmavenous)
dataFVre<- read.csv("./model/results/PBKresultsDose1_FVre1.01.csv") %>%
  select(compound, rownr, CplasmavenousFVre = Cplasmavenous)
dataQC<- read.csv("./model/results/PBKresultsDose1_QC1.01.csv") %>%
  select(compound, rownr, CplasmavenousQC = Cplasmavenous)
dataFQad<- read.csv("./model/results/PBKresultsDose1_FQad1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQad = Cplasmavenous)
dataFQbo<- read.csv("./model/results/PBKresultsDose1_FQbo1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQbo = Cplasmavenous)
dataFQbr<- read.csv("./model/results/PBKresultsDose1_FQbr1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQbr = Cplasmavenous)
dataFQgu<- read.csv("./model/results/PBKresultsDose1_FQgu1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQgu = Cplasmavenous)
dataFQhe<- read.csv("./model/results/PBKresultsDose1_FQhe1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQhe = Cplasmavenous)
dataFQki<- read.csv("./model/results/PBKresultsDose1_FQki1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQki = Cplasmavenous)
dataFQh<- read.csv("./model/results/PBKresultsDose1_FQh1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQh = Cplasmavenous)
#no sensitivity of FQlu can be calculated, the blood flow cannot be higher than 1
#dataFQlu<- read.csv("./model/results/PBKresultsDose1_FQlu1.01.csv") %>%
#  select(compound, rownr, CplasmavenousFQlu = Cplasmavenous)
dataFQmu<- read.csv("./model/results/PBKresultsDose1_FQmu1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQmu = Cplasmavenous)
dataFQsk<- read.csv("./model/results/PBKresultsDose1_FQsk1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQsk = Cplasmavenous)
dataFQsp<- read.csv("./model/results/PBKresultsDose1_FQsp1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQsp = Cplasmavenous)
dataFQte<- read.csv("./model/results/PBKresultsDose1_FQte1.01.csv") %>%
  select(compound, rownr, CplasmavenousFQte = Cplasmavenous)
#no sensitivity of FQre can be calculated, the blood flow cannot be higher than 1
#dataFQre<- read.csv("./model/results/PBKresultsDose1_FQre1.01.csv") %>%
#  select(compound, rownr, CplasmavenousFQre = Cplasmavenous)
dataKpad <- read.csv("./model/results/PBKresultsDose1_Kpad1.01.csv") %>%
  select(compound, rownr, Kpad,CplasmavenousKpad = Cplasmavenous)
dataKpbo <- read.csv("./model/results/PBKresultsDose1_Kpbo1.01.csv") %>%
  select(compound, rownr, Kpbo,CplasmavenousKpbo = Cplasmavenous)
dataKpbr <- read.csv("./model/results/PBKresultsDose1_Kpbr1.01.csv") %>%
  select(compound, rownr, Kpbr,CplasmavenousKpbr = Cplasmavenous)
dataKpgu <- read.csv("./model/results/PBKresultsDose1_Kpgu1.01.csv") %>%
  select(compound, rownr, Kpgu,CplasmavenousKpgu = Cplasmavenous)
dataKphe <- read.csv("./model/results/PBKresultsDose1_Kphe1.01.csv") %>%
  select(compound, rownr, Kphe,CplasmavenousKphe = Cplasmavenous)
dataKpki <- read.csv("./model/results/PBKresultsDose1_Kpki1.01.csv") %>%
  select(compound, rownr, Kpki,CplasmavenousKpki = Cplasmavenous)
dataKpli <- read.csv("./model/results/PBKresultsDose1_Kpli1.01.csv") %>%
  select(compound, rownr, Kpli,CplasmavenousKpli = Cplasmavenous)
dataKplu <- read.csv("./model/results/PBKresultsDose1_Kplu1.01.csv") %>%
  select(compound, rownr, Kplu,CplasmavenousKplu = Cplasmavenous)
dataKpmu <- read.csv("./model/results/PBKresultsDose1_Kpmu1.01.csv") %>%
  select(compound, rownr, Kpmu,CplasmavenousKpmu = Cplasmavenous)
dataKpsk <- read.csv("./model/results/PBKresultsDose1_Kpsk1.01.csv") %>%
  select(compound, rownr, Kpsk,CplasmavenousKpsk = Cplasmavenous)
dataKpsp <- read.csv("./model/results/PBKresultsDose1_Kpsp1.01.csv") %>%
  select(compound, rownr, Kpsp,CplasmavenousKpsp = Cplasmavenous)
dataKpte <- read.csv("./model/results/PBKresultsDose1_Kpte1.01.csv") %>%
  select(compound, rownr,CplasmavenousKpte = Cplasmavenous)
dataKpre <- read.csv("./model/results/PBKresultsDose1_Kpre1.01.csv") %>%
  select(compound, rownr,CplasmavenousKpre = Cplasmavenous)


by = c("compound","rownr")
dataCombined<-left_join(dose1, dataClint, by=by) %>%
  left_join(., dataFup, by=by) %>%
  left_join(., dataKa, by=by) %>%
  left_join(., dataFVli, by=by)%>%
  left_join(., dataBP, by=by) %>%
  left_join(., dataFa, by=by)%>%
  left_join(., dataFVad, by=by)%>%
  left_join(., dataFVbo, by=by)%>%
  left_join(., dataFVbr, by=by)%>%
  left_join(., dataFVgu, by=by)%>%
  left_join(., dataFVhe, by=by)%>%
  left_join(., dataFVki, by=by)%>%
  left_join(., dataFVlu, by=by)%>%
  left_join(., dataFVmu, by=by)%>%
  left_join(., dataFVsk, by=by)%>%  
  left_join(., dataFVte, by=by)%>%
  left_join(., dataFVve, by=by)%>%
  left_join(., dataFVar, by=by)%>%
  left_join(., dataFVre, by=by)%>%
  left_join(., dataFVsp, by=by)%>%
  left_join(., dataQC, by=by)%>%
  left_join(., dataFQad, by=by)%>%
  left_join(., dataFQbo, by=by)%>%
  left_join(., dataFQbr, by=by)%>%
  left_join(., dataFQgu, by=by)%>%
  left_join(., dataFQhe, by=by)%>%
  left_join(., dataFQki, by=by)%>%
  left_join(., dataFQh, by=by)%>%
  #left_join(., dataFQlu, by=by)%>%
  left_join(., dataFQmu, by=by)%>%
  left_join(., dataFQsk, by=by)%>%
  left_join(., dataFQsp, by=by) %>%
  left_join(., dataFQte, by=by)%>%
  #left_join(., dataFQre, by=by)%>%
  left_join(., dataKpad, by=by) %>%
  left_join(., dataKpbo, by=by) %>%
  left_join(., dataKpbr, by=by) %>%
  left_join(., dataKpgu, by=by) %>%
  left_join(., dataKphe, by=by) %>%
  left_join(., dataKpki, by=by) %>%
  left_join(., dataKpli, by=by) %>%
  left_join(., dataKplu, by=by) %>%
  left_join(., dataKpmu, by=by)  %>%
  left_join(., dataKpsk, by=by) %>%
  left_join(., dataKpsp, by=by) %>%
  left_join(., dataKpte, by=by) %>%
  left_join(., dataKpre, by=by) 

data<-dataCombined %>%
  mutate(scaling.factor = ifelse(method.Clint == "S9", 121, 
                                 ifelse(method.Clint == "in silico", 40,
                                        117.5)))%>%
  mutate(CLint = Clint/Fuinc*scaling.factor*0.036*70*60/1000)%>%  
  mutate(CLint = ifelse(CLint == 0, 1, CLint)) %>%
  mutate(NSC_CLint = (CplasmavenousClint-Cplasmavenous)/
           (CLint*1.01-CLint)*(CLint/Cplasmavenous)) %>%
  mutate(NSC_Fup = (CplasmavenousFup-Cplasmavenous)/
           (Fup*1.01-Fup)*(Fup/Cplasmavenous))%>%
  mutate(NSC_Ka = (CplasmavenousKa-Cplasmavenous)/
           (Ka*1.01-Ka)*(Ka/Cplasmavenous)) %>%
  mutate(NSC_FVli = (CplasmavenousFVli-Cplasmavenous)/
           (0.036*1.01-0.036)*(0.036/Cplasmavenous)) %>%
  mutate(NSC_Ka = (CplasmavenousKa-Cplasmavenous)/
           (Ka*1.01-Ka)*(Ka/Cplasmavenous)) %>%
  mutate(NSC_BP = (CplasmavenousBP-Cplasmavenous)/
           (1*1.01-1)*(1/Cplasmavenous)) %>%
  mutate(NSC_Fa = (CplasmavenousKa-Cplasmavenous)/
           (Fa*1.01-Fa)*(Fa/Cplasmavenous)) %>%
  mutate(NSC_FVad = (CplasmavenousFVad-Cplasmavenous)/
           (0.07*1.01-0.07)*(0.07/Cplasmavenous)) %>%
  mutate(NSC_FVbo = (CplasmavenousFVbo-Cplasmavenous)/
           (0659*1.01-0659)*(0659/Cplasmavenous)) %>%
  mutate(NSC_FVbr = (CplasmavenousFVbr-Cplasmavenous)/
           (0.0052*1.01-0.0052)*(0.0052/Cplasmavenous)) %>%
  mutate(NSC_FVgu = (CplasmavenousFVgu-Cplasmavenous)/
           (0.026*1.01-0.026)*(0.026/Cplasmavenous)) %>%
  mutate(NSC_FVhe = (CplasmavenousFVhe-Cplasmavenous)/
           (0.04*1.01-0.04)*(0.04/Cplasmavenous)) %>%
  mutate(NSC_FVhe = (CplasmavenousFVhe-Cplasmavenous)/
           (0.0044*1.01-0.0044)*(0.0044/Cplasmavenous)) %>%
  mutate(NSC_FVki = (CplasmavenousFVki-Cplasmavenous)/
           (0.0092*1.01-0.0092)*(0.0092/Cplasmavenous)) %>%
  mutate(NSC_FVlu = (CplasmavenousFVlu-Cplasmavenous)/
           (0.0052*1.01-0.0052)*(0.0052/Cplasmavenous)) %>%
  mutate(NSC_FVmu = (CplasmavenousFVmu-Cplasmavenous)/
           (0.488*1.01-0.488)*(0.488/Cplasmavenous)) %>%
  mutate(NSC_FVsk = (CplasmavenousFVsk-Cplasmavenous)/
           (0.1656*1.01-0.1656)*(0.1656/Cplasmavenous)) %>%
  mutate(NSC_FVsp = (CplasmavenousFVsp-Cplasmavenous)/
           (0.0024*1.01-0.0024)*(0.0024/Cplasmavenous)) %>%
  mutate(NSC_FVte = (CplasmavenousFVte-Cplasmavenous)/
           (0.012*1.01-0.012)*(0.012/Cplasmavenous)) %>%
  mutate(NSC_FVve = (CplasmavenousFVve-Cplasmavenous)/
           (0.0429*1.01-0.0429)*(0.0429/Cplasmavenous)) %>%
  mutate(NSC_FVar = (CplasmavenousFVar-Cplasmavenous)/
           (0.0215*1.01-0.0215)*(0.0215/Cplasmavenous)) %>%
  mutate(NSC_FVre = (CplasmavenousFVre-Cplasmavenous)/
           (0.04572*1.01-0.04572)*(0.04572/Cplasmavenous)) %>%
  mutate(NSC_QC = (CplasmavenousQC-Cplasmavenous)/
           (389.988*1.01-389.988)*(389.988/Cplasmavenous)) %>%
  mutate(NSC_FQad = (CplasmavenousFQad-Cplasmavenous)/
           (0.059*1.01-0.059)*(0.059/Cplasmavenous)) %>%
  mutate(NSC_FQbo = (CplasmavenousFQbo-Cplasmavenous)/
           (0.101*1.01-0.101)*(0.101/Cplasmavenous)) %>%
  mutate(NSC_FQbr = (CplasmavenousFQbr-Cplasmavenous)/
           (0.014*1.01-0.014)*(0.014/Cplasmavenous)) %>%
  mutate(NSC_FQgu = (CplasmavenousFQgu-Cplasmavenous)/
           (0.0659*1.01-0.0659)*(0.0659/Cplasmavenous)) %>%
  mutate(NSC_FQhe = (CplasmavenousFQhe-Cplasmavenous)/
           (0.04*1.01-0.04)*(0.04/Cplasmavenous)) %>%
  mutate(NSC_FQki = (CplasmavenousFQki-Cplasmavenous)/
           (0.145*1.01-0.145)*(0.145/Cplasmavenous)) %>%
  mutate(NSC_FQh = (CplasmavenousFQh-Cplasmavenous)/
           (0.242*1.01-0.242)*(0.242/Cplasmavenous)) %>%
  #mutate(NSC_FQlu = (CplasmavenousFQlu-Cplasmavenous)/
  #         (1*1.01-1)*(1/Cplasmavenous)) %>%
  mutate(NSC_FQmu = (CplasmavenousFQmu-Cplasmavenous)/
           (0.237*1.01-0.237)*(0.237/Cplasmavenous)) %>%
  mutate(NSC_FQsk = (CplasmavenousFQsk-Cplasmavenous)/
           (0.051*1.01-0.051)*(0.051/Cplasmavenous)) %>%
  mutate(NSC_FQte = (CplasmavenousFQte-Cplasmavenous)/
           (0.0078*1.01-0.0078)*(0.0078/Cplasmavenous)) %>%
  #mutate(NSC_FQre = (CplasmavenousFQre-Cplasmavenous)/
  #         (0.1032*1.01-0.1032)*(0.1032/Cplasmavenous)) %>%
  mutate(NSC_FQsp = (CplasmavenousFQsp-Cplasmavenous)/
           (0.011*1.01-0.011)*(0.011/Cplasmavenous)) %>%
  mutate(NSC_Kpad = (CplasmavenousKpad-Cplasmavenous)/
           (Kpad*1.01-Kpad)*(Kpad/Cplasmavenous)) %>%
  mutate(NSC_Kpbo = (CplasmavenousKpbo-Cplasmavenous)/
           (Kpbo*1.01-Kpbo)*(Kpbo/Cplasmavenous)) %>%
  mutate(NSC_Kpbr = (CplasmavenousKpbr-Cplasmavenous)/
           (Kpbr*1.01-Kpbr)*(Kpbr/Cplasmavenous)) %>%
  mutate(NSC_Kpgu = (CplasmavenousKpgu-Cplasmavenous)/
           (Kpgu*1.01-Kpgu)*(Kpgu/Cplasmavenous)) %>%
  mutate(NSC_Kphe = (CplasmavenousKphe-Cplasmavenous)/
           (Kphe*1.01-Kphe)*(Kphe/Cplasmavenous)) %>%
  mutate(NSC_Kpki = (CplasmavenousKpki-Cplasmavenous)/
           (Kpki*1.01-Kpki)*(Kpki/Cplasmavenous)) %>%
  mutate(NSC_Kpli = (CplasmavenousKpli-Cplasmavenous)/
           (Kpli*1.01-Kpli)*(Kpli/Cplasmavenous)) %>%
  mutate(NSC_Kplu = (CplasmavenousKplu-Cplasmavenous)/
           (Kplu*1.01-Kplu)*(Kplu/Cplasmavenous)) %>%
  mutate(NSC_Kpmu = (CplasmavenousKpmu-Cplasmavenous)/
           (Kpmu*1.01-Kpmu)*(Kpmu/Cplasmavenous)) %>%
  mutate(NSC_Kpsk = (CplasmavenousKpsk-Cplasmavenous)/
           (Kpsk*1.01-Kpsk)*(Kpsk/Cplasmavenous)) %>%
  mutate(NSC_Kpsp = (CplasmavenousKpsp-Cplasmavenous)/
           (Kpsp*1.01-Kpsp)*(Kpsp/Cplasmavenous)) %>%
  mutate(NSC_Kpte = (CplasmavenousKpte-Cplasmavenous)/
           (Kpmu*1.01-Kpmu)*(Kpmu/Cplasmavenous)) %>%
  mutate(NSC_Kpre = (CplasmavenousKpre-Cplasmavenous)/
           (Kpmu*1.01-Kpmu)*(Kpmu/Cplasmavenous)) 

