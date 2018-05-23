# This R file creates the second plot for ExData_Plot

hpcData <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE)
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"),]
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)

hpcData <- transform.data.frame(hpcData, DateTime = paste(Date, Time, sep=" "))
hpcData$DateTime <- strptime(hpcData$DateTime, format="%d/%m/%Y %H:%M:%S")

plot(x=hpcData$DateTime, y=hpcData$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png, 'plot2.png')
dev.off()