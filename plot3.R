
if (!(flag = exists("useCustomGrid"))) # We are not creating the plot3
    png(filename = "plot3.png")        # Creating plot3 in PNG file

# Reading the inputData, if it's not done yet
firstPlot <- FALSE
source("plot1.R")

# Indexes for Sub_metering_1, Sub_metering_2, Sub_metering_3 columns
first   <- 7
indexes <- c(first, 8, 9)

# Set of colors for the lines, which correspond to the indexes:
col <- c("black", "red", "blue")

# Create the plot with no points
plot(inputData$DateTime, 
     inputData[, indexes[1]],
     "n",
     xlab = "",
     ylab = "Energy sub metering")


# Creating lines for different indexes
for (i in indexes)
    points(inputData$DateTime, inputData[, i], type = "l", col = col[i - first + 1])

if (!exists("bty"))
    bty <- "o"

legend("topright", 
       legend = names(inputData)[indexes],
       col = col,
       bty = bty,
       lty = c(1, 1, 1))

rm(bty)

if (!flag)
    dev.off()    # Close device, if it was open here
