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
plot(names(totemissions),totemissions/1e6,type="h", 
     lwd=10, 
     lend=2, 
     col="red", 
     xlab='year', 
     ylab='PM2.5 (Megatons)', 
     main='Total Annual PM2.5 Emissions')
##Plot 2
Baltemissions=subset(NEI,fips=="24510")

#with(Baltemissions, tapply(Emissions, year.f, sum))
totBalt<-with(Baltemissions, tapply(Emissions, year.f, sum))
plot(names(totBalt),totBalt/1e3,type="h", 
     lwd=10, 
     lend=2, 
     col="red", 
     xlab='year', 
     ylab='PM2.5 (Kilotons)', 
     main='Baltimore Annual PM2.5 Emissions')
##Plot 3
Baltyeartype<-data.frame(with(Baltemissions, tapply(Emissions, list(year.f, type.f), sum)))
year=0
type=0
emissions=0


Baltmelt<-data.frame(year,type,emissions)
i=0
for(row in 1:nrow(Baltyeartype)) 
  {
  #print(paste('Generating disease profile for case', row, '...'))
  for(col in 1:ncol(Baltyeartype)) 
    {
    i=i+1
    Baltmelt[i,1]=row.names(Baltyeartype)[row]
    Baltmelt[i,2]=names(Baltyeartype[col,])[col]
    Baltmelt[i,3]=Baltyeartype[row,col]
    
    }
  }

Baltmelt[,1]<-factor(Baltmelt[,1])
Baltmelt[,2]<-factor(Baltmelt[,2])

qplot(year,emissions,data=Baltmelt, facets=type~.)

##function to find coal combustion
#Plot 4

b<-SCC[grep('Coal',SCC[,'EI.Sector']),]
a<-grep('Mobile',b[,'EI.Sector'])
SCCMot<-b[a,][,1]

NEICoal<-NEI[NEI$SCC%in%SCCCoal,]
with(NEICoal, tapply(Emissions, year.f, sum))
totemissions<-with(NEICoal, tapply(Emissions, year.f, sum))
plot(names(totemissions),totemissions/1e6,type="h", 
     lwd=10, 
     lend=2, 
     col="red", 
     xlab='year', 
     ylab='PM2.5 (Megatons)', 
     main='Annual Coal Combustion PM2.5 Emissions')

##function to find motor vehicle
#Plot 5

b<-SCC[grep('Mobile',SCC[,'EI.Sector']),]
a<-grep('On-Road',b[,'EI.Sector'])
SCCMot<-b[a,][,1]
Baltemissions=subset(NEI,fips%in%"24510")
NEIMot<-Baltemissions[Baltemissions$SCC%in%SCCMot,]
with(NEIMot, tapply(Emissions, year.f, sum))
totemissions<-with(NEIMot, tapply(Emissions, year.f, sum))
plot(names(totemissions),totemissions,type="h", 
     lwd=10, 
     lend=2, 
     col="red", 
     xlab='year', 
     ylab='PM2.5 (Megatons)', 
     main='Annual Motor Vehicle PM2.5 Emissions Baltimore')


##function to find motor vehicle
#Plot 6

b<-SCC[grep('Mobile',SCC[,'EI.Sector']),]
a<-grep('On-Road',b[,'EI.Sector'])
SCCMot<-b[a,][,1]
Baltemissions=subset(NEI,fips%in%"06037")
NEIMot<-Baltemissions[Baltemissions$SCC%in%SCCMot,]
with(NEIMot, tapply(Emissions, year.f, sum))
totemissions<-with(NEIMot, tapply(Emissions, year.f, sum))
plot(names(totemissions),totemissions,type="h", 
     lwd=10, 
     lend=2, 
     col="red", 
     xlab='year', 
     ylab='PM2.5 (Megatons)', 
     main='Annual Motor Vehicle PM2.5 Emissions Los Angeles')