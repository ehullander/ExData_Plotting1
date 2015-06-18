#Plot 4
#set working directory to that which contains the data file
#plot is saved as .png
plotme<-function()
{
#Get Data
EPC<-mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub1<-subset(EPC,Date=="1/2/2007"|Date=="2/2/2007", stringsAsFactors = FALSE)

#Set up 4 plots on one device
par(mfrow=c(2,2))
par(mar=c(4,4,4,4))
#plot topleft Global Active Power
t=as.POSIXct(paste(sub1[,1], sub1[,2]), format="%d/%m/%Y %H:%M:%S")
G=sub1[,"Global_active_power"]
plot(t,G, type="l", xlab="",ylab="Global Active Power (kilowatts)")


#plot topright Voltage
V=sub1[,"Voltage"]
plot(t,V, type="l", xlab="date time",ylab="Voltage", col="black")

#plot bottomleft energy submetering
s1=sub1[,"Sub_metering_1"]
s2=sub1[,"Sub_metering_2"]
s3=sub1[,"Sub_metering_3"]

plot(t,s1, type="l", xlab="",ylab="Energy sub metering", col="black" )
lines(t,s2, col="red")
lines(t,s3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=2, lty=c(1,1), col = c("black", "red", "blue"))


#bottomright Global Reactive Power
V=sub1[,"Voltage"]
plot(t,V, type="l", xlab="date time",ylab="Voltage", col="black")

}




png(filename="Plot4.png", width = 1300, height = 1300)
plotme()
dev.off()