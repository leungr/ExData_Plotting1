##-------- Read data ---------------

## Assumes the txt file is in the same directory as this R file

data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors= FALSE)

## -------- Apply filters ------------

## Filter for dates (as char strings) and the filter out the global_intensity column
subsetdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",c(1:5,7:9)]

## Reformat so data and time are in one column and rest of columns leave as is
plotdata <- data.frame(strptime(paste(subsetdata[,1],subsetdata[,2]),format = "%d/%m/%Y %H:%M:%S"),subsetdata[,3:8])

## --------- Generate plots ------------
png(file = "plot4.png", width = 480, height = 480, type = "cairo")
par(mfrow=c(2,2))

#Top-left
plot(plotdata[,1],plotdata[,2], typ='l', ylab="Global Active Power", xlab="", col="black", lty="solid")

#Top-right
plot(plotdata[,1],plotdata[,4], typ='l', ylab="Voltage", xlab="datetime", col="black", lty="solid")

#BottomLeft
plot(plotdata[,1],plotdata[,5], typ='l', ylab="Energy sub metering", xlab="", col="black", lty="solid")
lines(plotdata[,1], plotdata[,6], lty="solid", col="red")
lines(plotdata[,1], plotdata[,7], lty="solid", col="blue")
legend("topright", lty="solid", bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Bottom-right
plot(plotdata[,1],plotdata[,3], typ='l', ylab="Global_reactive_power", xlab="datetime", col="black", lty="solid")

dev.off()