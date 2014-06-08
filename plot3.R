initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100)
classes <- sapply(initial, class)
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

pc$dt <- paste(pc$Date, pc$Time)
pc$dt <- strptime(as.character(pc$dt), format= "%d/%m/%Y %H:%M:%S")

pc$Date <- as.Date(as.character(pc$Date), format="%d/%m/%Y")
pc <- pc[pc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plotting
png("plot3.png")
with(pc, plot(dt, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n" ))
with(pc, lines(dt, Sub_metering_1) )
with(pc, lines(dt, Sub_metering_2, col="red") )
with(pc, lines(dt, Sub_metering_3, col="blue") )
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()