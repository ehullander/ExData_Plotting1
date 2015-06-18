#Plot 1
#set working directory to that which contains the data file
#plot is saved as .png
EPC<-mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub1<-subset(EPC,Date=="1/2/2007"|Date=="2/2/2007", stringsAsFactors = FALSE)
hist(sub1[,"Global_active_power"], breaks=15, col="red", main="Global Active Power", xlab="Global Active Power")
png(filename="Plot1.png")
hist(sub1[,"Global_active_power"], breaks=15, col="red", main="Global Active Power", xlab="Global Active Power")
dev.off()