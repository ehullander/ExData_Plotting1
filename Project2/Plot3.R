## This first line will likely take a few seconds. Be patient!

require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##make year and pollutant factor variables
NEI[,'year.f']<-factor(as.character(NEI$year))
NEI[,'type.f']<-factor(as.character(NEI$type))

##Plot 3
Baltyeartype<-data.frame(with(Baltemissions, tapply(Emissions, list(year.f, type.f), sum)))
year=0
type=0
emissions=0
#rearrange for qplot
Baltmelt<-data.frame(year,type,emissions)
i=0
for(row in 1:nrow(Baltyeartype)) 
{
  for(col in 1:ncol(Baltyeartype)) 
  {
    i=i+1
    Baltmelt[i,1]=row.names(Baltyeartype)[row]
    Baltmelt[i,2]=names(Baltyeartype[col,])[col]
    Baltmelt[i,3]=Baltyeartype[row,col]   
  }
}
#convert year and type to factors
Baltmelt[,1]<-factor(Baltmelt[,1])
Baltmelt[,2]<-factor(Baltmelt[,2])
#plot
png(filename="Plot3.png", width = 600, height = 600)
qplot(year,emissions,data=Baltmelt, 
      group=1, 
      geom=c("line","point"),
      colour=type, 
      facets=type~.,
      main="Baltimore Emissions by Type")
dev.off()