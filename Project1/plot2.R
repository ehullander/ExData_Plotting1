#Plot 2
#set working directory to that which contains the data file
#plot is saved as .png
EPC<-mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub1<-subset(EPC,Date=="1/2/2007"|Date=="2/2/2007", stringsAsFactors = FALSE)
t=as.POSIXct(paste(sub1[,1], sub1[,2]), format="%d/%m/%Y %H:%M:%S")
G=sub1[,"Global_active_power"]
plot(t,G, type="l", xlab="",ylab="Global Active Power (kilowatts)")
png(filename="Plot2.png")
plot(t,G, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()