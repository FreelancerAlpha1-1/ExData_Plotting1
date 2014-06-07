Plot 1 

## Set the Working Directory
setwd("C://mydocuments/ExData_Plotting1")

## Read the txt file into R
data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Set the Dates To Be Between 2007-02-01 and 2007-02-02.
start.time <- as.Date("01/02/2007", format = "%d/%m/%Y")
end.time <- as.Date("02/02/2007", format = "%d/%m/%Y")

png(filename="plot1.png")

## Make Plot 1 
hist(data$Global_active_power[data$Date == start.time | data$Date == end.time],
     breaks = 12,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
