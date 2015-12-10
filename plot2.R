n <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
       "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
table <- read.table("household_power_consumption.txt", sep=";", header=F, 
                    col.names=n, skip=66637, nrows=2880, stringsAsFactors=F)
table$date_time <- as.POSIXct(strptime(paste(table$Date, table$Time, sep=" "), 
                                       format="%d/%m/%Y %H:%M:%S"))

png(filename = "Rplot2.png", width = 480, height = 480)
plot(table$Global_active_power~table$date_time, type="l", xlab=
       "", ylab = "Global Active Power (kilowatts)")
dev.off()
