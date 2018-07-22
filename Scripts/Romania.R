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

### Barplot1 for livestock attributes ### 

# order the ranks so that they represent the logical order 
RO$Rank_R2 <- factor(RO$Rank_R, levels = c("Rank3", "Rank2", "Rank1"))

# Plot the chart wih flipped x and y axis 
(WW_Bar0 <- ggplot(RO, aes(x=Factor_R, y=Score_R, fill=factor(Rank_R2))) + 
  geom_bar(stat="identity") + coord_flip() +
  labs(title = "Rare Breeds") +
  theme(aspect.ratio = .9, axis.text.y=element_text (size=11), axis.text.x=element_text (size=11), 
        plot.title = element_text(hjust = 0.5)) +
  theme_set(theme_gray(base_size = 14)) + # This is changing the size of the fonts 
  ylab("Score") +                             
  xlab("\nFactor") +
  guides(fill=guide_legend(title="Rank")) + 
  scale_x_discrete(breaks=c("Yield_RB","Vet_bills_RB","Product_quality_RB", 
                            "Management_RB", "Fertility_RB", "Disease_parasitic_RB", 
                            "Cultural_tradition_RB", "Adaptability_RB"),
                   labels=c("Yield", "Vet Bills", "Product Quality", "Management and Handling", 
                            "Fertility", "Disease/Parasitic Resistance", "Cultural Tradition", "Adaptability")))


### Barplot2 for livestock attributes ### 

# order the ranks so that they represent the logical order 
RO$Rank_N2 <- factor(RO$Rank_N, levels = c("Rank3", "Rank2", "Rank1"))

# Plot the chart wih flipped x and y axis 
(WW_Bar1 <- ggplot(RO, aes(x=Factor_N, y=Score_N, fill=factor(Rank_N2))) + 
  geom_bar(stat="identity") + coord_flip() +
  labs(title = "Non-Rare Breeds") +
  theme(aspect.ratio = .9, axis.text.y=element_text (size=11), axis.text.x=element_text (size=11), 
        plot.title = element_text(hjust = 0.5)) +
  theme_set(theme_gray(base_size = 14)) + # This is changing the size of the fonts 
  ylab("Score") +                             
  xlab("\nFactor") +
  guides(fill=guide_legend(title="Rank")) + 
  scale_x_discrete(breaks=c("Yield_NRB","Vet_bills_NRB","Product_quality_NRB", 
                            "Management_NRB", "Fertility_NRB", "Disease_parasitic_NRB", 
                            "Cultural_tradition_NRB", "Adaptability_NRB"),
  labels=c("Yield", "Vet Bills", "Product Quality", "Management and Handling", 
           "Fertility", "Disease/Parasitic Resistance", "Cultural Tradition", "Adaptability")))
  
# Arrange the two plots into a Panel 
panel <- grid.arrange(WW_Bar0, WW_Bar1, ncol=2)
ggsave(panel, file="RO_Rank_RBF.png", width=20, height=10)

