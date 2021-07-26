library(tidyverse)
source("./calculateSensitivity.R")
  
dataFigure <-  data %>%
  gather(., key = "organ", value = "NSC",
         NSC_CLint:last_col()) %>%
  mutate(organ = ifelse(organ == "NSC_CLint", "NSC_CLint,u", organ))%>%
  mutate(organ = ifelse(organ == "NSC_Ka", "NSC_ka", organ))%>%
  mutate(organ = ifelse(organ == "NSC_Fa", "NSC_fa", organ))%>%
  mutate(organ = ifelse(organ == "NSC_Fup", "NSC_fup", organ))%>%
  group_by(organ) %>%
  mutate(maxNSC = max(abs(NSC))) %>%
  filter(organ %in%  c("NSC_CLint,u", "NSC_QC", "NSC_FVli", "NSC_FVmu", 
                     "NSC_ka", "NSC_fa", "NSC_fup", "NSC_BP"))

#fct_reorder(organ, maxNSC)
sensitivity<-  ggplot(dataFigure, aes(x=organ, y=NSC)) + 
  geom_jitter(binaxis='y', stackdir='center', width =0.2, legend = FALSE, size = 2) + 
  xlab("") +
  labs(tag = "A")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        text = element_text(size = 25),
        legend.position= "none",
        legend.title = element_blank(),
        legend.key = element_rect(colour = NA, fill = NA),
        axis.text.x = element_text(size=25),#, vjust = 1.05, hjust=1.05
        axis.text.y = element_text(size=25),
        plot.tag.position = 'topleft')

sensitivity


