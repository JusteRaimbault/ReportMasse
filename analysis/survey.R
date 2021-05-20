
setwd(paste0(Sys.getenv('CS_HOME'),'/Transportation/ReportMasse/Models/ReportMasse'))

library(ggplot2)
source(paste0(Sys.getenv('CS_HOME'),'/Organisation/Models/Utils/R/plots.R'))

# data disruption
xperturb = c("Never", "Once a month", "2-3 times\na month", "More than 4\ntimes a month")
yperturb = c(15.4,34.6,30.8,19.2)

ggplot(data.frame(xperturb,yperturb),aes(x=factor(xperturb,levels=xperturb),y=yperturb))+
  xlab("")+ylab("Percentage of users\nexperiencing disruptions")+geom_bar(stat="identity")+stdtheme
ggsave(file='results/survey-disruption.png',width=25,height=11,units='cm')

# choice no info
xnoinfo = c("Wait for the\ndisruption to end","Wait for\ninformation","Change for\nmetro 1","Change for\nbus","Change for\nbike","Change for\ntrain L")
ynoinfo = c(30.8,3.8,46.2,3.8,7.7,7.7)

ggplot(data.frame(xnoinfo,ynoinfo),aes(x=factor(xnoinfo,levels=xnoinfo),y=ynoinfo))+
  xlab("")+ylab("Choice of users\nwithout information")+geom_col()+stdtheme
ggsave(file='results/survey-noinfo.png',width=25,height=11,units='cm')

# choice info
xinfo = c("Wait for the\ndisruption to end", "Change for\nmetro 1", "Change for bus")
yinfo = c(77.3,18.2,4.5)

ggplot(data.frame(xinfo,yinfo),aes(x=factor(xinfo,levels=xinfo),y=yinfo))+
  xlab("")+ylab("Choice of users\nwith information")+geom_col()+stdtheme
ggsave(file='results/survey-info.png',width=25,height=11,units='cm')




