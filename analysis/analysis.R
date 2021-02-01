
setwd(paste0(Sys.getenv('CS_HOME'),'/Teaching/2020-OACMO/ReportMasse'))

library(dplyr)
library(ggplot2)

source(paste0(Sys.getenv('CS_HOME'),'/Organisation/Models/Utils/R/plots.R'))

res <- as.tbl(read.csv('exploration/20210121_215409_GRIDEXPLORATION_GRID.csv'))

summary(res %>% group_by(id) %>% summarise(count = n()))


params = c("arrivalRate","rerCapacity","rerInterval","betaCongestion","betaWaiting")
indicators = c("averageCongestion","averageTravelTime","averageModeShareRer","shareDivertedUsers","averageWaitingUsers")

for(indic in indicators){
  for(arrivalRate in unique(res$arrivalRate)){
    g=ggplot(res[res$arrivalRate==arrivalRate,],aes_string(x="betaCongestion",y=indic,colour="betaWaiting",group="betaWaiting"))
    ggsave(plot = g+geom_point(pch='.')+geom_smooth()+facet_grid(rerCapacity~rerInterval,scales="free")+stdtheme,filename = paste0('results/',indic,'-betaCongestion_colour-betaWaiting_facet-rerCapacity-rerInterval_arrivalRate-',arrivalRate,'.png'),width=30,height=25,units='cm')
    }
}

# targeted plot
arrivalRate = 100
rerIntervals=c(6,10)
rerCapacities=c(10,1010)

for(indic in indicators){
    g=ggplot(res[res$arrivalRate==arrivalRate&res$rerInterval%in%rerIntervals&res$rerCapacity%in%rerCapacities,],aes_string(x="betaCongestion",y=indic,colour="betaWaiting",group="betaWaiting"))
    ggsave(plot = g+geom_point(pch='.')+geom_smooth()+facet_grid(rerCapacity~rerInterval,scales="free")+stdtheme,filename = paste0('results/',indic,'-betaCongestion_colour-betaWaiting_facet-rerCapacity-rerInterval_arrivalRate-',arrivalRate,'_TARGETED.png'),width=20,height=15,units='cm')
}

