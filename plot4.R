library(data.table)
dataset <- suppressWarnings(subset(fread("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";"), Date=="1/2/2007"| Date=="2/2/2007"))
dataset <- dataset[, FullDate:=paste(dataset$Date, dataset$Time, sep=" ")]
dataset$FullDate <- as.POSIXct(strptime(dataset$FullDate, format="%d/%m/%Y %H:%M:%S", tz=""))
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(dataset, {
  plot(FullDate, Global_active_power, xlab="", ylab="Global Active Power", type = "l", col = "black")
  plot(FullDate, Voltage, xlab="datetime", ylab="Voltage", type = "l", col = "black")
  plot(FullDate, Sub_metering_1, xlab="", ylab="Energy sub metering", 
  type = "l", col ="black")
  lines(x=FullDate, y=Sub_metering_2, col="red")
  lines(x=FullDate, y=Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n")  
 plot(FullDate, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l", col = "black") 
})
dev.off()