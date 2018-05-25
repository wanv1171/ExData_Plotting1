# This R file creates the third plot for ExData_Plot

hpcData <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE)
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"),]
hpcData$Global_active_power <- as.numeric(hpcData$Global_active_power)

hpcData <- transform.data.frame(hpcData, DateTime = paste(Date, Time, sep=" "))
hpcData$DateTime <- strptime(hpcData$DateTime, format="%d/%m/%Y %H:%M:%S")
hpcData$Sub_metering_1 <- as.numeric(hpcData$Sub_metering_1)
hpcData$Sub_metering_2 <- as.numeric(hpcData$Sub_metering_2)
hpcData$Sub_metering_3 <- as.numeric(hpcData$Sub_metering_3)

png(filename="plot3.png")

plot(x=hpcData$DateTime, y=hpcData$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
lines(x=hpcData$DateTime, y=hpcData$Sub_metering_2, type = "l", col = "red")
lines(x=hpcData$DateTime, y=hpcData$Sub_metering_3, type = "l", col = "blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()