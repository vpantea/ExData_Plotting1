#setwd("C:\\Coursera\\ExploratoryDataAnalysis\\week1\\data")
dt <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
nrow(dt)
dt <- subset(dt, dt$Date %in% c('1/2/2007', '2/2/2007'))
nrow(dt)
dt$newTime <- strptime(paste(dt$Date, dt$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
par(bg='white')
par(mfrow = c(2, 2))
with(dt, {
	plot(newTime,  Global_active_power, type="l", ylab="Global Active Power", xlab="", col="black")
	plot(newTime,  Voltage, type="l", ylab="Voltage", xlab="datetime")
	
	{
		plot(newTime,  Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
		points(newTime,  Sub_metering_2, type="l", col="red")
		points(newTime,  Sub_metering_3, type="l", col="blue")
		legend("topright" , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, lwd=1, bty="n", col=c("black", "red", "blue")  )
	}	
	
	plot(newTime,  Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.copy(png, file = "plot4.png",  width=480,height=480, bg = "white")
dev.off()


