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
png(file = "plot1.png")
## Plot
par(bg="transparent")
with(specData, hist(specData$Global_active_power,
        col = "Red", border = "Black", bg="transparent",
        main = "Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency"))
dev.off() 
## Close