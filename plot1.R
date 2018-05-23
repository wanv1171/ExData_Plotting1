# This R file creates the first plot for ExData_Plot

hpcData <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE)
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"),]
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)

hist(x = hpcData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.copy(png, 'plot1.png')
dev.off()