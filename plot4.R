initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100)
classes <- sapply(initial, class)
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

pc$dt <- paste(pc$Date, pc$Time)
pc$dt <- strptime(as.character(pc$dt), format= "%d/%m/%Y %H:%M:%S")

pc$Date <- as.Date(as.character(pc$Date), format="%d/%m/%Y")
pc <- pc[pc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plotting
png("plot4.png")
par(mfrow = c(2,2))

## Plot 1
with(pc, plot(dt, Global_active_power, ylab="Global Active Power", xlab="", type="n" ))
with(pc, lines(dt, Global_active_power) )

## Plot 2
with(pc, plot(dt, Voltage, ylab="Voltage", xlab="datetime", type="n"))
with(pc, lines(dt, Voltage,))

## Plot 3
with(pc, plot(dt, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n" ))
with(pc, lines(dt, Sub_metering_1) )
with(pc, lines(dt, Sub_metering_2, col="red") )
with(pc, lines(dt, Sub_metering_3, col="blue") )
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

## Plot 4
with(pc, plot(dt, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n"))
with(pc, lines(dt, Global_reactive_power))

dev.off()