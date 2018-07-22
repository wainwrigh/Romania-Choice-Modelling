# Library
library(ggplot2)
library(fmsb)

#==================
RO <- read.csv ("C:/Users/wwainwright/Documents/R/Romania/Data/Livestock_attributes_3.csv") 
RO2 <- read.csv ("C:/Users/wwainwright/Documents/R/Romania/Data/Livestock_attributes_4.csv") 
RO3 <- read.csv ("C:/Users/wwainwright/Documents/R/Romania/Data/Livestock_attributes_5.csv") 
RO4 <- read.csv ("C:/Users/wwainwright/Documents/R/Romania/Data/Livestock_attributes_6.csv") 


# Create the binds for the plot 

RO=rbind(rep(40,8) , rep(0,8) , RO)
RO2=rbind(rep(40,8) , rep(0,8) , RO2)
RO3=rbind(rep(40,8) , rep(0,8) , RO3)
RO4=rbind(rep(40,8) , rep(0,8) , RO4)


#==================
# Plot 1: Default radar chart proposed by the library:
radarchart(RO)
radarchart(RO2)
radarchart(RO3)
radarchart(RO4)


#==================
# Plot 2: Same plot with custom features (Rank 1)
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( RO  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,40,10), cglwd=1.0,
            #custom labels
            vlcex=0.8) 

#==================
# Plot 3: Same plot with Rank 2
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( RO2  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,40,10), cglwd=0.8,
            #custom labels
            vlcex=0.8) 

#==================
# Plot 4: Same plot with Rank 3
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( RO3  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,40,10), cglwd=0.8,
            #custom labels
            vlcex=0.8)

# Add a new blank plot (where the legend will appear)
plot.new()

# Add a legend
legend("bottomright", 
       legend = c("Farmers keeping rare breed", "Farmers keeping commercial breed"), 
       col = c(rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9), 
               rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4)), 
       pch = c(19,19), 
       bty = "n", 
       pt.cex = 2, 
       cex = 1.3, 
       text.col = "black", 
       horiz = F , 
       inset = c(-0.1, 0.2))

## Arrange each plot into a Panel of two plots 
par(mar=c(0.5, 0.5, 0.5, 0.5)) #decrease default margin
layout(matrix(1:2, ncol=2)) #draw 2 plots to device
