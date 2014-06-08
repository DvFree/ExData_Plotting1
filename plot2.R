initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100)
classes <- sapply(initial, class)
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

pc$dt <- paste(pc$Date, pc$Time)
pc$dt <- strptime(as.character(pc$dt), format= "%d/%m/%Y %H:%M:%S")

pc$Date <- as.Date(as.character(pc$Date), format="%d/%m/%Y")
pc <- pc[pc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plotting
with(pc, plot(dt, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n" ))
with(pc, lines(dt, Global_active_power) )
dev.copy(png, file="plot2.png")
dev.off()