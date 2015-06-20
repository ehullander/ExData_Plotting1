## This first line will likely take a few seconds. Be patient!

require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##make year and pollutant factor variables
NEI[,'year.f']<-factor(as.character(NEI$year))
NEI[,'type.f']<-factor(as.character(NEI$type))

#Plot 4
#look for coal combustion
b<-SCC[grep('Coal',SCC[,'EI.Sector']),]
a<-grep('Comb',b[,'EI.Sector'])
SCCCoal<-b[a,][,1]

#join NEI on SCCCoal where SCC=SCC
NEICoal<-NEI[NEI$SCC%in%SCCCoal,]
with(NEICoal, tapply(Emissions, year.f, sum))
totemissions<-with(NEICoal, tapply(Emissions, year.f, sum))
#plot
png(filename="Plot4.png", width = 600, height = 600)
plot(names(totemissions),totemissions,type="h", 
     lwd=100, 
     lend=2, 
     col="grey", 
     xlab='year', 
     ylab='PM2.5 (tons)', 
     main='Annual Coal Combustion PM2.5 Emissions')
dev.off()