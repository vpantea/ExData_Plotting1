#setwd("C:\\Coursera\\ExploratoryDataAnalysis\\week1\\data")
dt <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
nrow(dt)
dt <- subset(dt, dt$Date %in% c('1/2/2007', '2/2/2007'))
nrow(dt)
dt$newTime <- strptime(paste(dt$Date, dt$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
par(bg='white')
with(dt, {
	plot(newTime,  Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
	points(newTime,  Sub_metering_2, type="l", col="red")
	points(newTime,  Sub_metering_3, type="l", col="blue")
	legend("topright" , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue")  )
})
dev.copy(png, file = "plot3.png",  width=480,height=480, bg = "white")
dev.off()


