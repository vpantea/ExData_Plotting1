#setwd("C:\\Coursera\\ExploratoryDataAnalysis\\week1\\data")
dt <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
nrow(dt)
dt <- subset(dt, dt$Date %in% c('1/2/2007', '2/2/2007'))
nrow(dt)
dt$newTime <- strptime(paste(dt$Date, dt$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
par(bg='white')
with(dt, plot(newTime,  Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file = "plot2.png",  width=480,height=480, bg = "white")
dev.off()


