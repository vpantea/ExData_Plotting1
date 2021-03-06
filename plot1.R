#setwd("C:\\Coursera\\ExploratoryDataAnalysis\\week1\\data")
dt <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
nrow(dt)
dt <- subset(dt, dt$Date %in% c('1/2/2007', '2/2/2007'))
nrow(dt)
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
par(bg='white')
hist(dt$Global_active_power, col="RED", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png",  width=480,height=480, bg = "white")
dev.off()

##



