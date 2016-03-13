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


png("plot3.png", width=480, height=480)
plot(epwr$timestamp,epwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(epwr$timestamp,epwr$Sub_metering_2,col="red")
        lines(epwr$timestamp,epwr$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()