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
png(file = "plot2.png")
## Generate Plot
par(bg="transparent")
plot(specData$Global_active_power,type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,length(specData$Global_active_power)/2+1,length(specData$Global_active_power)),
     labels=c("Thu","Fri","Sat"))
dev.off() 
## Close 
