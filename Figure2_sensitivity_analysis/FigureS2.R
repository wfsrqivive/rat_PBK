library(tidyverse)
library(grid)
library(gridExtra)


correlationFigure<-function(parameter, selectedCompound){
source("./calculateSensitivity.R")

data<-data %>%
  select(all_of(c(parameter,selectedCompound)))

ggplot()+
  geom_point(data = data, 
             aes(x=data[,1], y=data[,2]), size = 1, stroke = 2)+#, show.legend = FALSE
  xlab(paste(parameter)) +
  ylab(paste(selectedCompound)) +
  scale_x_log10(breaks = c(0.1, 1, 10^(1:100)), 
                labels = c(0.1, 1, 10^(1:100))) +
  guides(shape=guide_legend(nrow=5,byrow=TRUE))+
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

}

NSC_BP<-correlationFigure("CLint","NSC_BP")
NSC_CLint<-correlationFigure("CLint","NSC_CLint")
NSC_fa<-correlationFigure("CLint","NSC_Fa")
NSC_fup<-correlationFigure("CLint","NSC_Fup")
NSC_FVli<-correlationFigure("CLint","NSC_FVli")
NSC_FVmu<-correlationFigure("CLint","NSC_FVmu")
NSC_Ka<-correlationFigure("CLint","NSC_Ka")
NSC_QC<-correlationFigure("CLint","NSC_QC")

tiff("FigureS2.tiff", units="in", width=30, height=30, res=100)

grid.arrange(NSC_BP, NSC_CLint,NSC_fa, 
             NSC_fup,NSC_FVli, NSC_FVmu, 
             NSC_Ka, NSC_QC,
             layout_matrix = rbind(c(1,1,2,2,3,3),
                                   c(4,4,5,5,6,6),
                                   c(7,7,8,8,NA,NA)
                                   
             ))
dev.off()



