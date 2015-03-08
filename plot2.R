
dataset <- suppressWarnings(subset(fread("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";"), Date=="1/2/2007"| Date=="2/2/2007"))
dataset <- dataset[, FullDate:=paste(dataset$Date, dataset$Time, sep=" ")]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$FullDate <- as.POSIXct(strptime(dataset$FullDate, format="%d/%m/%Y %H:%M:%S", tz=""))
png(file = "plot2.png", width = 480, height = 480)
plot(dataset$FullDate, dataset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.off()
