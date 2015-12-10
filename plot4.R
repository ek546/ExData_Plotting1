n <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
       "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
table <- read.table("household_power_consumption.txt", sep=";", header=F, 
                    col.names=n, skip=66637, nrows=2880, stringsAsFactors=F)
melted <- melt(table, measure.vars=c("Sub_metering_1", "Sub_metering_2",
                                     "Sub_metering_3"))
table$date_time <- as.POSIXct(strptime(paste(table$Date, table$Time, sep=" "), 
                                       format="%d/%m/%Y %H:%M:%S"))

png(filename = "Rplot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(melted, {
  plot(table$Global_active_power~table$date_time, type="l", xlab=
         "", ylab = "Global Active Power")
  plot(table$Voltage~table$date_time, type="l", xlab=
         "datetime", ylab = "Voltage")
  with(melted, plot(date_time, value, type = "n", ylab="Energy sub metering",
                    xlab=""))
  with(subset(melted, variable=="Sub_metering_1"),
       lines(date_time, value, col = "black"))
  with(subset(melted, variable=="Sub_metering_2"),
       lines(date_time, value, col = "red"))
  with(subset(melted, variable=="Sub_metering_3"),
       lines(date_time, value, col = "blue"))
  legend("topright", lty=c(1,1), col = c("black", "blue", "red"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(table$Global_reactive_power~table$date_time, type="l", xlab=
         "datetime", ylab = "Global_reactive_power")
})
dev.off()