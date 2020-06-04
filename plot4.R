#Exploratory Data Analysis course - week 1 - Peer graded assignment
#Aditya Kakodkar 2020
#output: plot4.png
#note: Please make sure that the file 'household_power_consumption.txt' in your working directory before running this file

#read file 
epc <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, na.strings = "?", stringsAsFactors = FALSE)

#add column names
names(epc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#combine date and time
epc$DateTime <- paste(epc$Date, epc$Time, sep = " ")

#convert DateTime to r classes
epc$DateTime <- strptime(epc$DateTime, "%d/%m/%Y %H:%M:%S")

#remove old Date and Time columns
epc <- subset(epc, select =-c(Date, Time))

#rearrange dataframe columns
epc <- epc[, c(8, 1:7)]

#plot4
png(file="plot4.png", width=480, height=480)
#set layout and margins
par(mfrow = c(2, 2), mar = c(5, 5, 2, 2))                     
#plot4.1
plot(epc$DateTime, epc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#plot4.2
plot(epc$DateTime, epc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot4.3
plot(epc$DateTime, epc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_2, type = "l", col = "red")
lines(epc$DateTime, epc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty = 1, bty = "n")
#plot4.4
plot(epc$DateTime, epc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()