
# Preparing the inputData, if it's not done yet
# 
if (!exists("inputData")) {
    
    # Reading data file, if it's not done yet
    inputData <- read.table("household_power_consumption.txt", 
                            header=TRUE, 
                            sep=";",
                            colClasses = c(rep("character",2), rep("numeric",7)), 
                            na.strings = "?")


    # Extracting data from begDate to endDate 

    begDate <- "2007-02-01"
    endDate <- "2007-02-02"
    inputData <- subset(inputData, (date = as.Date(inputData$Date, format = "%d/%m/%Y")) >= begDate & date <= endDate)
    
    # Combine date + Time in one column
    inputData$DateTime <- as.POSIXct(paste(as.Date(inputData$Date, format = "%d/%m/%Y"), inputData$Time))
}

# Creating 1x1 grid for the plot
if (!exists("useCustomGrid")) {
    par(mfcol = c(1, 1))
} else
    rm(useCustomGrid)

globalActivePower   <- "Global Active Power"
globalActivePowerKW <- paste(globalActivePower, "(kilowatts)")
if (!exists("firstPlot")) {
    # Creating plot1 in PNG file
    png(filename = "plot1.png")
    
    # Plotting the histogram 
    hist(inputData$Global_active_power, 
        main=globalActivePower, 
        xlab=globalActivePowerKW, 
        ylab="Frequency",
        col="red")
    
    # Close device
    dev.off()
} else
    rm(firstPlot)