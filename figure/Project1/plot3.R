#Plot 3
#set working directory to that which contains the data file
#plot is saved as .png
EPC<-mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
sub1<-subset(EPC,Date=="1/2/2007"|Date=="2/2/2007", stringsAsFactors = FALSE)
t=as.POSIXct(paste(sub1[,1], sub1[,2]), format="%d/%m/%Y %H:%M:%S")
s1=sub1[,"Sub_metering_1"]
s2=sub1[,"Sub_metering_2"]
s3=sub1[,"Sub_metering_3"]

plot(t,s1, type="l", xlab="",ylab="Energy sub metering", col="black")
lines(t,s2, col="red")
lines(t,s3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"))

png(filename="Plot3.png")
plot(t,s1, type="l", xlab="",ylab="Energy sub metering", col="black")
lines(t,s2, col="red")
lines(t,s3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"))

dev.off()