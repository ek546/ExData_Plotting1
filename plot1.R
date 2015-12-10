n <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
       "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
table <- read.table("household_power_consumption.txt", sep=";", header=F, 
                    col.names=n, skip=66637, nrows=2880, stringsAsFactors=F)
png(filename = "plot1.png", width = 480, height = 480)
hist(table$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")
dev.off()