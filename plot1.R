#Exploratory Data Analysis course - week 1 - Peer graded assignment
#Aditya Kakodkar 2020
#output: plot1.png
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

#plot1
png(file="plot1.png", width=480, height=480)
hist(epc$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()