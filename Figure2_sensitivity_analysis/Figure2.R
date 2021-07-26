library(gridExtra)
library(grid)
###Clrenal!!!###
source("calculateSensitivityDotPlot.R", local =TRUE)
source("correlationClint_NSCClint.R", local =TRUE)

tiff("Figure2.tiff", units="in", width=30, height=10, res=100)

grid.arrange(sensitivity, correlation,
             layout_matrix = rbind(c(1,1,1,2,2)
                                   ))
dev.off()