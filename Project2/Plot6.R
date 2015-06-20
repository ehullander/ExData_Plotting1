## This first line will likely take a few seconds. Be patient!

require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##make year and pollutant factor variables
NEI[,'year.f']<-factor(as.character(NEI$year))
NEI[,'type.f']<-factor(as.character(NEI$type))

#Plot 6

b<-SCC[grep('Mobile',SCC[,'EI.Sector']),]
a<-grep('On-Road',b[,'EI.Sector'])
SCCMot<-b[a,][,1]
Baltemissions=subset(NEI,fips%in%"24510")
#join Baltemissions on SCCMot where SCC=SCC
NEIMot<-Baltemissions[Baltemissions$SCC%in%SCCMot,]
with(NEIMot, tapply(Emissions, year.f, sum))
totemissions<-with(NEIMot, tapply(Emissions, year.f, sum))
#plot
png(filename="Plot6.png", width = 600, height = 600)
par(mfrow=c(1,2))
par(mar=c(4,4,4,4))
plot(names(totemissions),totemissions,type="h", 
     lwd=50, 
     lend=2, 
     col="grey", 
     xlab='year', 
     ylab='PM2.5 (tons)', 
     main='Motor Vehicle Emissions Baltimore')

b<-SCC[grep('Mobile',SCC[,'EI.Sector']),]
a<-grep('On-Road',b[,'EI.Sector'])
SCCMot<-b[a,][,1]
Baltemissions=subset(NEI,fips%in%"06037")
NEIMot<-Baltemissions[Baltemissions$SCC%in%SCCMot,]
with(NEIMot, tapply(Emissions, year.f, sum))
totemissions<-with(NEIMot, tapply(Emissions, year.f, sum))

plot(names(totemissions),totemissions,type="h", 
     lwd=50, 
     lend=2, 
     col="grey", 
     xlab='year', 
     ylab='PM2.5 (tons)', 
     main='Motor Vehicle Los Angeles')
dev.off()