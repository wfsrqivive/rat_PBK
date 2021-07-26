library(gridExtra)
library(grid)

source("fraction_unbound.R", local =TRUE)
source("partition_coefficients.R", local =TRUE)
source("hepatic_clearance.R", local =TRUE)
source("uptake_ka_fa.R", local =TRUE)

tiff("Figure3.tiff", units="in", width=30, height=15, res=300)

grid.arrange(pb,pc,pa,p,
             layout_matrix = rbind(c(1,1,2,2),
                                   c(3,3,4,4)
             ))
dev.off()