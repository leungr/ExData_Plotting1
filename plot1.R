##-------- Read data ---------------

## Assumes the txt file is in the same directory as this R file

data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors= FALSE)

## -------- Apply filters ------------

## Filter for dates (as char strings) and on Global Active Power column
plotdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",3]

## --------- Generate plot ------------
png(file = "plot1.png", width = 480, height = 480)
hist(plotdata,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()