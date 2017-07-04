if (!(flag = exists("useCustomGrid")))  # We are not creating the plot4
    png(filename = "plot2.png")         # Creating plot2 in PNG file

# Reading the inputData, if it's not done yet
firstPlot <- FALSE
source("plot1.R")

# Setting the label for axis Y
ylab <- globalActivePowerKW    # default label
if (exists("useKW")) {
    if (!useKW)
        ylab <- globalActivePower
    
    rm(useKW)
}

# Creating plot
plot(inputData$DateTime, 
     inputData$Global_active_power, 
     type="l", 
     xlab="", 
     ylab=ylab)

if (!flag)
    dev.off()    # Close device, if it was open here
