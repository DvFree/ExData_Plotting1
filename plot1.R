initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100)
classes <- sapply(initial, class)
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

pc$Date <- as.Date(as.character(pc$Date), format="%d/%m/%Y")
pc <- pc[pc$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plotting
with(pc, hist(pc$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.copy(png, file="plot1.png")
dev.off()