
library(data.table)
dataset <- suppressWarnings(subset(fread("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";"), Date=="1/2/2007"| Date=="2/2/2007"))
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
png(file = "plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power" )
dev.off()
