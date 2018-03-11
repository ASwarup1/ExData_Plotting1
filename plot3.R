## Coursera Data Science Course 4 - Exploratory Data Analysis
# Project 1 - A. Swarup
# Plot 3 - Enery sub metering
##
# Read all data
rm(list = ls())
hpcData <- read.csv(file="C:/Users/ASwar/edarepo1/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Set working directory
setwd("C:/Users/ASwar/edarepo1")

# Date range dates
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

# Change the Date field from format day/month/year to string YYYY-MM-DD
hpcData$Date <- as.Date(hpcData$Date,  format="%d/%m/%Y")

# Extract data to be plotted., i.e., in the date range  DATE1-DATE2
plotData <- hpcData[hpcData$Date >= DATE1 & hpcData$Date <= DATE2,]

# Combine Date and Time in a string datetime
plotData$datetime <- with(plotData, as.POSIXct(paste(Date,Time), format="%Y-%m-%d %H:%M:%S"))

# Plot 3 - Energy sub metering
attach(plotData)
plot.new()
plot(Sub_metering_1 ~ datetime, type='l', ylab="Energy sub metering", xlab="")
lines(Sub_metering_2 ~ datetime, col="Red")
lines(Sub_metering_3 ~ datetime, col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=2)
mtext("Plot 3", side=3, line=1, adj=0, cex=1, font=2)

# Copy to file
dev.copy(png, file="plot3.png", height=480, width=480)

# Housekeeping
detach(plotData)
dev.off()
# graphics(off)
