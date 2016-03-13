setwd()
fh <- read.table("household_power_consumption.txt",  header=T, sep=";")
fh$Date <- as.Date(fh$Date, format="%d/%m/%Y")
epwr <- fh[(fh$Date=="2007-02-01") | (fh$Date=="2007-02-02"),]
epwr$Global_active_power <- as.numeric(as.character(epwr$Global_active_power))
epwr$Global_reactive_power <- as.numeric(as.character(epwr$Global_reactive_power))
epwr$Voltage <- as.numeric(as.character(epwr$Voltage))
epwr <- transform(epwr, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
epwr$Sub_metering_1 <- as.numeric(as.character(epwr$Sub_metering_1))
epwr$Sub_metering_2 <- as.numeric(as.character(epwr$Sub_metering_2))
epwr$Sub_metering_3 <- as.numeric(as.character(epwr$Sub_metering_3))


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#PLOT 1 
plot(epwr$timestamp,epwr$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#PLOT 2
plot(epwr$timestamp,epwr$Voltage, type="l", xlab="datetime", ylab="Voltage")
#PLOT 3
plot(epwr$timestamp,epwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(epwr$timestamp,epwr$Sub_metering_2,col="red")
lines(epwr$timestamp,epwr$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
#PLOT 4
plot(epwr$timestamp,epwr$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()       