## This first line will likely take a few seconds. Be patient!

require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##make year and pollutant factor variables
NEI[,'year.f']<-factor(as.character(NEI$year))
NEI[,'type.f']<-factor(as.character(NEI$type))

##Plot 2
Baltemissions=subset(NEI,fips=="24510")
totBalt<-with(Baltemissions, tapply(Emissions, year.f, sum))
png(filename="Plot2.png", width = 600, height = 600)
plot(names(totBalt),totBalt,type="h", 
     lwd=100, 
     lend=2, 
     col="grey", 
     xlab='year', 
     ylab='PM2.5 (tons)', 
     main='Baltimore Annual PM2.5 Emissions')
dev.off()