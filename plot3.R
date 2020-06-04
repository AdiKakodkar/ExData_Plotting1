#Exploratory Data Analysis course - week 1 - Peer graded assignment
#Aditya Kakodkar 2020
#output: plot3.png
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

#plot3
png(file="plot3.png", width=480, height=480)
plot(epc$DateTime, epc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_2, type = "l", col = "red")
lines(epc$DateTime, epc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty = 1)
dev.off()