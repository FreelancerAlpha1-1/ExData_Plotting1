library(data.table)

## Set up the working Directory

setwd("C://mydocuments/ExData_Plotting1")

## Read the data 

data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Filter the dates 

pwr = data[data$Date %in% c("2/2/2007","1/2/2007"),]

## Create Object Filter 

dates = with(pwr,strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

## Create the Plot 

png(filename="plot3.png",width=480,height=480)
par(fg="black",mar=c(3,4,2,2))
plot(dates,pwr$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(dates,pwr$Sub_metering_1,col="black")
lines(dates,pwr$Sub_metering_2,col="red")
lines(dates,pwr$Sub_metering_3,col="blue")

## Also create the legend 

legend("topright", col=c("black", "red", "blue"),lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

