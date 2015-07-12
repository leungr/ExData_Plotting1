##-------- Read data ---------------

## Assumes the txt file is in the same directory as this R file

data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors= FALSE)

## -------- Apply filters ------------

## Filter for dates (as char strings) and the following columns: Date, Time, submetering 1-3
subsetdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",c(1:2,7:9)]

## Reformat so data and time are in one column and submeterings left as is
plotdata <- data.frame(strptime(paste(subsetdata[,1],subsetdata[,2]),format = "%d/%m/%Y %H:%M:%S"),subsetdata[,3:5])

## --------- Generate plot ------------
png(file = "plot3.png", width = 480, height = 480)
plot(plotdata[,1],plotdata[,2], typ='l', ylab="Energy sub metering", xlab="", col="black", lty="solid")
lines(plotdata[,1],plotdata[,3],col = "red", lty="solid")
lines(plotdata[,1],plotdata[,4],col = "blue", lty="solid")
legend("topright", lty="solid", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()