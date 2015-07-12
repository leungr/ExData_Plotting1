##-------- Read data ---------------

## Assumes the txt file is in the same directory as this R file

data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors= FALSE)

## -------- Apply filters ------------

## Filter for dates (as char strings) and the first three columns: Date, Time, Global Active Power column
subsetdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",c(1:3)]

## Reformat so data and time are in one column and Global Active Power is in the other column
plotdata <- data.frame(strptime(paste(subsetdata[,1],subsetdata[,2]),format = "%d/%m/%Y %H:%M:%S"),subsetdata[3])

## --------- Generate plot ------------
png(file = "plot2.png", width = 480, height = 480)
plot(plotdata, typ='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()