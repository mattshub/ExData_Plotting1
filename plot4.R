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
png(file = "plot4.png")
## Generate Plot
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), bg="transparent")
with(specData, {
        plot(Global_active_power,type="l",
             xaxt="n", xlab="", ylab="Global Active Power")
        axis(1, at=c(1,length(Global_active_power)/2+1,length(Global_active_power)),
             labels=c("Thu","Fri","Sat"))
        plot(Voltage,type="l", xaxt="n", xlab="datetime", ylab="Voltage")
        axis(1, at=c(1,length(Voltage)/2+1,length(Voltage)),
             labels=c("Thu","Fri","Sat"))
        plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
        lines(Sub_metering_2,type="l", col="Red")
        lines(Sub_metering_3,type="l", col="Blue")
        axis(1, at=c(1,length(Sub_metering_1)/2+1,length(Sub_metering_1)),
             labels=c("Thu","Fri","Sat"))
        legend("topright",cex=1, lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power,type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
        axis(1, at=c(1,length(Global_reactive_power)/2+1,length(Global_reactive_power)),
             labels=c("Thu","Fri","Sat"))
})
dev.off()
## Close 
