
# Creating plot4 in PNG file
png(filename = "plot4.png")


# Creating 2x2 grid for the plot 
par(mfcol = c(2, 2))
useCustomGrid <- TRUE


# Creating the plot2 in upper left corner
useKW <- FALSE   # for not using "kilowatts" in label
source("plot2.R")


# Creating the plot3 in lower left corner
bty <- "n"   # in order not to draw a box around the legend
useCustomGrid <- TRUE
source("plot3.R")


# Creating the 2 plots for 5-th and 4-th variables 
# (which are "Voltage" and "Global_reactive_powers") of the inputData
for (i in c(5, 4)) {
    plot(inputData$DateTime,
        inputData[, i],
        type = "l",
        xlab = "datetime",
        ylab = names(inputData)[i])
}

# Close device
dev.off()

