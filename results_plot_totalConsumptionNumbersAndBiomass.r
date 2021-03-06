#library(streamgraph)
library(RColorBrewer)
library(viridis)
op <- par()

#if(makepng==TRUE)
  png("results_plot_totalConsumptionNumbersAndBiomass.png", width = 600, height = 600, pointsize = 12)

par(mfrow=c(2,2), mai=c(0.4,1,0.1,0.1))

myCols = c(grey(0.0),grey(0.33), grey(0.66), grey(0.85))[4:1]
myCols = viridis(4)

barplot((apply(BC_phjromyta[,,,,,,6:46,,1],c(1,7),sum)/1000000),
        col=myCols,
        space=0,
        names.arg = rep("",41),
        border=myCols,
        cex.axis=1.2,
        cex.lab=1.2,
        axes=FALSE,
        xaxs="i",
        las=1,
        ylab="Biomass consumed (1000s tons)")
axis(1,
     at = seq(1,41,5)-0.5,
     labels = seq(1,41,5)+1974,
)
axis(2,las=1)
text(30,0.6, paste("(",letters[1],")"))
box()


legend(3,0.6,
       legend=predNames[order(-1*1:4)],
       pch=15,
       bty="n",
       pt.cex = 1.5,
       border=FALSE,
       col=myCols[order(-1*1:4)])


barplot((apply(BC_phjromyta[,,,,,,6:46,,2:6],c(1,7),sum)/1000000),
        col=myCols,
        space=0,
        names.arg = rep("",41),
        border=myCols,
        cex.axis=1.2,
        cex.lab=1.2,
        axes=FALSE,
        xaxs="i",
        las=1,
        ylab="Biomass consumed (1000s tons)")
axis(1,
     at = seq(1,41,5)-0.5,
     labels = seq(1,41,5)+1974,
)
axis(2,las=1)
text(30,13.5, paste("(",letters[2],")"))
box()

barplot((apply(NC_phjromyta[,,,,,,6:46,,1],c(1,7),sum)/1000000), 
          beside=FALSE,
        col=myCols,
        names.arg = rep("",41),
        xaxs="i",
        axes=FALSE,
        space=0,
        border=myCols,
        cex.axis=1.2,
        cex.lab=1.2,
        ylab="Numbers consumed (millions)",
             las=1) 

axis(1,
     at = seq(1,41,5)-0.5,
     labels = seq(1,41,5)+1974,
)
axis(2,las=1)
text(30,25, paste("(",letters[3],")"))
box()



barplot((apply(NC_phjromyta[,,,,,,6:46,,2:6],c(1,7),sum)/1000000), 
        beside=FALSE,
        col=myCols,
        names.arg = rep("",41),
        xaxs="i",
        axes=FALSE,
        space=0,
        border=myCols,
        cex.axis=1.2,
        cex.lab=1.2,
        ylab="Numbers consumed (millions)",
        las=1) 

axis(1,
     at = seq(1,41,5)-0.5,
     labels = seq(1,41,5)+1974,
)
axis(2,las=1)
text(30,3.75, paste("(",letters[4],")"))
box()

legend(1,30,
       legend=predNames[order(-1*1:4)],
       pch=15,
       bty="n",
       pt.cex = 1.5,
       border=FALSE,
       col=myCols[order(-1*1:4)])


#if(makepng==TRUE)
  dev.off()
par(op)
