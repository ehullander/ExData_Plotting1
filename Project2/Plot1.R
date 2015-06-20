## This first line will likely take a few seconds. Be patient!

require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##make year and pollutant factor variables
NEI[,'year.f']<-factor(as.character(NEI$year))
NEI[,'type.f']<-factor(as.character(NEI$type))

##Plot 1
#with(NEI, tapply(Emissions, year.f, sum))
totemissions<-with(NEI, tapply(Emissions, year.f, sum))
png(filename="Plot1.png", width = 600, height = 600)
plot(names(totemissions),totemissions,type="h", 
     lwd=100, 
     lend=2, 
     col="grey", 
     xlab='year', 
     ylab='PM2.5 (tons)', 
     main='Total Annual PM2.5 Emissions')
dev.off()

