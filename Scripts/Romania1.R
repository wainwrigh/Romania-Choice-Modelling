###############################################################################################################################
############################################# RO Plotting #####################################################################
###############################################################################################################################

#set working directory & load data 
getwd()
setwd ("C:/Users/wwainwright/Documents/R")
RO <- read.csv ("C:/Users/wwainwright/Documents/R/Romania/Livestock_attributes1.csv") 

# Libraries
library(ggplot2)
library(gridExtra)

#### Barplot 1 for livestock attributes ### 

# order the ranks so that they represent the logical order 
RO$Rank_R <- ordered(RO$Rank_R, levels = c("Rank3", "Rank2", "Rank1"), labels = c("Rank 3", "Rank 2", "Rank 1"))

# Plot the chart wih flipped x and y axis 
WW_Bar0 <- ggplot(data = RO, aes(x = Factor_R, y = Score_R, fill = factor(Rank_R))) +
geom_bar(stat="identity") + coord_flip() +
  print(WW_Bar0 + ggtitle("Non-Rare Breeds") +
  ylab("Score") +                             
  xlab("\nFactor") +
  guides(fill=guide_legend(title="Rank"))  

### Barplot2 for livestock attributes ### 

# order the ranks so that they represent the logical order 
RO$Rank_N <- ordered(RO$Rank_N, levels = c("Rank3", "Rank2", "Rank1"), labels = c("Rank 3", "Rank 2", "Rank 1"))

# Plot the chart wih flipped x and y axis 
WW_Bar1 <- ggplot(RO, aes(x=Factor_N, y=Score_N, fill=factor(Rank_N))) + 
  geom_bar(stat="identity") + coord_flip() +
  print(WW_Bar1 + ggtitle("Non-Rare Breeds") +
  ylab("Score") +                             
  xlab("\nFactor") +
  guides(fill=guide_legend(title="Rank")) 
  

# Arrange the two plots into a Panel 
panel <- grid.arrange(WW_Bar0, WW_Bar1, ncol=2)
ggsave(panel, file="RO_Rank_RBF.png", width=10, height=8)

