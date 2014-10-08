## R Code to read Household Power Consumption Data and Generate Plots
## Author : Matt

## Read Power Consumption Text file into Data Table
classes <- c("character","character","numeric","numeric","numeric","numeric",
                "numeric","numeric","numeric")
powerData <- read.table("household_power_consumption.txt",sep=";",
                                header=TRUE, na.strings="?", colClasses=classes, nrows=2075259)
## Filter for specific dates
rows <- grep("^1/2/2007|^2/2/2007", powerData$Date)
specData <- powerData[rows,]

## Open PNG Device
png(file = "plot3.png")
## Generate Plot
par(bg="transparent")
plot(specData$Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(specData$Sub_metering_2,type="l", col="Red")
lines(specData$Sub_metering_3,type="l", col="Blue")
axis(1, at=c(1,length(specData$Sub_metering_1)/2+1,length(specData$Sub_metering_1)),
     labels=c("Thu","Fri","Sat"))
legend("topright", cex=1.1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
## Close