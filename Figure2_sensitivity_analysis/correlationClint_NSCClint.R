library(tidyverse)
source("./calculateSensitivity.R")

correlation <- ggplot()+
  geom_point(data = data, 
             aes(CLint, NSC_CLint), size = 1, stroke = 2)+#, show.legend = FALSE
  xlab("CLint,u") +
  ylab("NSC_CLint,u") +
  scale_x_log10(breaks = c(0.1, 1, 10^(1:100)), 
                labels = c(0.1, 1, 10^(1:100))) +
  guides(shape=guide_legend(nrow=5,byrow=TRUE))+
  labs(tag = "B")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        text = element_text(size = 25),
        legend.key = element_rect(fill = NA),
        legend.text=element_text(size=25),
        legend.title = element_blank(),
        axis.text.x = element_text(size=25),
        axis.text.y = element_text(size=25),
        axis.title.x = element_text(size=25),
        plot.tag.position = 'topleft') 

correlation



