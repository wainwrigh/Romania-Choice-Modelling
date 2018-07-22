######################################################################################################
#################################  Contract Participation ############################################
######################################################################################################

# Set working directory and load the data ----
setwd ("C:/Users/wwainwright/Documents/R/Romania")
CP <- read.csv("C:/Users/wwainwright/Documents/R/Romania/Data/ContractProbabilities2.csv")
head(CP)
  
# Libraries
library(tidyr)
library(dplyr)
library(ggplot2)
library(readr)
library(gridExtra)
library(directlabels)
library(ggrepel)
library(scales)

# 1.0 Line Plot of contract probabilities ---- 

# Inspecting the data frame 
dim(CP)
lapply(CP, class)
str(CP)

#CPB <- CP[CP$Animal == "Bovine" ,] # Filter for just bovines
#CPO <- CP[CP$Animal == "Ovine" ,] # Filter for just bovines

# Plot a line chart with different colours for each Model 

P1 <- ggplot(CP, aes(x=Subsidy, y=Participation, group=Type)) +
  facet_wrap(~CP$Animal, scales = "free_x")+
  geom_line(aes(linetype=Type), size=1)+
  geom_point()+
  ylab("Probability of participation (%)\n") +
  xlab("\nPayment rate (euro per animal/year)") +
  theme_bw()+
  theme(
    strip.text.x = element_text(size = 20),
    axis.text.x=element_text (size=20, angle=50, vjust=0.5, hjust=0.5),
    axis.text.y=element_text (size=20, angle=0, vjust=0.5, hjust=0.5),
  axis.title=element_text(size=20))
P1

# Puts the legend on the top and increases the size
P1 + theme(legend.position="top", legend.title=element_blank(), legend.text=element_text(size=20)) 
  
  
# Make the chart grey style
wbar1+scale_fill_grey()
