library(tidyverse)
library(httk)

#f.input.data<-function(){
######Intestinal uptake######
R<-0.18 #radius small intestine
Tsi<-1.63 #small intestine transit time 
kt<-1/(Tsi/7)
#background:
#https://pubmed.ncbi.nlm.nih.gov/10486429/
#https://pub.iapchem.org/ojs/index.php/admet/article/view/638
insilico.KaFa<-read.csv("./input/physchem_input_Ka_calculations.csv") %>%
  #https://pubmed.ncbi.nlm.nih.gov/17727800/
  mutate(Papp.cm.power.minus.six.per.s = 10^(-4.36 - 0.01*T_PSA)*1000000)%>%
  #conversion Caco-2 Papp to human Peff
  mutate(Peff.cm.power.minus.four.per.s.human = (10^(0.4926*log10(Papp.cm.power.minus.six.per.s)- 0.1454)))%>%
  #conversion human Peff to rat Peff
  mutate(Peff.cm.power.minus.four.per.s = Peff.cm.power.minus.four.per.s.human/11.04)%>%
  mutate(Peff.cm.per.hr = Peff.cm.power.minus.four.per.s/10000*3600)%>%
  mutate(Ka= (Peff.cm.per.hr*2)/R) %>%
  mutate(Fa = 1-(1+Ka/kt)**-7) %>%
  select(compound, CAS, Ka, Fa)%>%
  mutate(method.KaFa = "in silico")

invitro.KaFa<-read.csv("./input/invitro_Papp_input.csv") %>%
  #conversion Caco-2 Papp to human Peff
  mutate(Peff.cm.power.minus.four.per.s.human = (10^(0.4926*log10(PappAB)- 0.1454)))%>%
  #conversion human Peff to rat Peff
  mutate(Peff.cm.power.minus.four.per.s = Peff.cm.power.minus.four.per.s.human/11.04)%>%
  mutate(Peff.cm.per.hr = Peff.cm.power.minus.four.per.s/10000*3600)%>%
  mutate(Ka= (Peff.cm.per.hr*2)/R) %>%
  mutate(Fa = 1-(1+Ka/kt)**-7) %>%
  select(compound, CAS, Ka, Fa)%>%
  mutate(method.KaFa = "in vitro")


KaFa<-rbind(insilico.KaFa,invitro.KaFa)

######Hepatic clearance######
clearance<-read.csv("./input/invitro_insilico_clearance_input.csv")%>%
  mutate(scaling.factor = ifelse(method.Clint == "S9", 165, 
                                 ifelse(method.Clint == "in silico", 45,
                                        125)))

######Fup and partition coefficients######
source("./functions/ionization_calculations.R", local =TRUE)
source("./functions/Fup.R", local = TRUE)
source("./functions/Fuinc.R", local = TRUE)
source("./functions/partition_Berezhkovskiy.R", local = TRUE)
source("./functions/partition_RodgersRowland.R", local = TRUE)
source("./functions/partition_Schmitt.R", local = TRUE)
tissue_comp<-read.csv("./input/unified_tissue_comp.csv")

phys.chem<-read.csv("./input/physchem_input.csv") %>%
  #calculate the fractions ionized (acid/base) from these data as input to further calculations
  rowwise() %>%
  mutate(frac.unionized =  f.frac.unionized(ionization, pH = 7.4, pKa1, pKa2))%>%
  mutate(frac.ionized.acid = f.frac.ionized.acid(ionization, pH = 7.4, pKa1, pKa2)) %>%
  mutate(frac.ionized.base = f.frac.ionized.base(ionization, pH = 7.4, pKa1, pKa2)) %>%
  mutate(type = ifelse(ionization == "neutral", 1,
                       ifelse(ionization == "monoproticAcid", 2, 
                              ifelse(ionization == "monoproticBase", 3,
                                     ifelse(ionization == "diproticAcid", 4,
                                            ifelse(ionization == "diproticBase", 5, 6))))))


invitro.Fup<-read.csv("./input/invitro_Fup_input.csv")%>%
  #to be able to compound with the calculated Fup a column is added
  mutate(method.phys.chem.Fup = NA)%>%
  mutate(Fut = 1/(1+(((1-Fup)/Fup)*0.5)))%>%
  select(compound, CAS, method.phys.chem.Fup, Fup, Fut, method.Fup, reference.Fup, original.reference.Fup)

######PBK-model input calculations######
insilico.Fup<-phys.chem %>%
  #calculate the fraction unbound in plasma based on Lobell, M.; Sivarajah, V. 
  mutate(Fup = f.Fup(ionization , frac.unionized, frac.ionized.acid, frac.ionized.base, logP, quat.nitrogen)) %>%
  mutate(Fut = 1/(1+(((1-Fup)/Fup)*0.5)))%>%
  mutate(reference.Fup = "LobellSivarajah")%>%
  mutate(original.reference.Fup = "LobellSivarajah")%>%
  mutate(method.Fup = "in silico") %>%
  select(compound, CAS, "method.phys.chem.Fup" = method.phys.chem, Fup,Fut, method.Fup, reference.Fup, original.reference.Fup)%>%
  bind_rows(.,invitro.Fup)

Berezhkovskiy.partition.coefficient<-
  full_join(insilico.Fup, phys.chem)  %>%
  rowwise() %>%
  mutate(calcKp_Berez_Result= calcKp_Berez(logP, pKa1, pKa2, pKa3=NA,Fup, BP=1, type, dat = tissue_comp)) %>%
  unnest_wider(calcKp_Berez_Result) %>%
  mutate(method.partition="Berezhkovskiy") %>%
  select(compound, CAS, method.phys.chem.Fup, Fup, Fut, method.Fup,            
         reference.Fup, original.reference.Fup, ionization,             
         pKa1, pKa2, logP, logD, method.phys.chem, quat.nitrogen,         
         frac.unionized, frac.ionized.acid, frac.ionized.base, type,
         Kpad, Kpbo, Kpbr, Kpgu, Kphe, Kpki, 
         Kpli, Kplu, Kpmu, Kpsk, Kpsp, method.partition)

RodgersRowland.partition.coefficient<-
  full_join(insilico.Fup, phys.chem)  %>%
  rowwise() %>%
  mutate(calcKp_RR_Result= calcKp_RR(logP, pKa1, pKa2, pKa3=NA,Fup, BP=1, type, dat = tissue_comp))%>%
  unnest_wider(calcKp_RR_Result) %>%
  mutate(method.partition="RodgersRowland") %>%
  select(compound, CAS, method.phys.chem.Fup, Fup, Fut, method.Fup,            
         reference.Fup, original.reference.Fup, ionization,             
         pKa1, pKa2, logP, logD, method.phys.chem, quat.nitrogen,         
         frac.unionized, frac.ionized.acid, frac.ionized.base, type,
         Kpad, Kpbo, Kpbr, Kpgu, Kphe, Kpki, 
         Kpli, Kplu, Kpmu, Kpsk, Kpsp, method.partition)

Schmitt.partition.coefficient <-
  full_join(insilico.Fup, phys.chem)  %>%
  rowwise() %>%
  mutate(calcKp_Schmitt_Result= calcKp_Schmitt(logP, pKa1, pKa2, pKa3=NA, Fup, type, dat = tissue_comp))%>%
  unnest_wider(calcKp_Schmitt_Result) %>%
  mutate(method.partition="Schmitt") %>%
  select(compound, CAS, method.phys.chem.Fup, Fup, Fut, method.Fup,            
         reference.Fup, original.reference.Fup, ionization,             
         pKa1, pKa2, logP, logD, method.phys.chem, quat.nitrogen,         
         frac.unionized, frac.ionized.acid, frac.ionized.base, type,
         Kpad, Kpbo, Kpbr, Kpgu, Kphe, Kpki, 
         Kpli, Kplu, Kpmu, Kpsk, Kpsp, method.partition)

partition.coefficients<-rbind(Berezhkovskiy.partition.coefficient, 
                              RodgersRowland.partition.coefficient,
                              Schmitt.partition.coefficient) %>%
                              ungroup()%>%
# remove input in which the the ADMET physchem data are used for Fup and BASF data for partition coefficient and viase versa
                              mutate(dummyFilter = ifelse(method.phys.chem.Fup == method.phys.chem| is.na(method.phys.chem.Fup),0,1)) %>% #
                              filter(dummyFilter == 0)%>%
                              select(-dummyFilter)

invivo.dose.Cmax<-  read.csv("./input/invivo_Cmax_references.csv", stringsAsFactors = FALSE)

PBK.input.data<-inner_join(KaFa, partition.coefficients, by = c("compound","CAS")) %>%
  inner_join(., clearance, by = c("compound","CAS")) %>%
  rowwise() %>%
  mutate(Fuinc = round(f.Fuinc(method.Clint, frac.unionized, frac.ionized.acid, frac.ionized.base, logD, logP, conc.enzymes.Clint),3)) %>%
  mutate(method.Fuinc="in silico")%>%
  inner_join(., invivo.dose.Cmax, by = c("compound","CAS"))

write.csv(PBK.input.data, "./input/inputDataFile.csv")
