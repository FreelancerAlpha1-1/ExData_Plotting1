library(data.table)

## Set up the working Directory

setwd("C://mydocuments/ExData_Plotting1")

## Read the data 

data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Filter the dates 

pwr = data[data$Date %in% c("2/2/2007","1/2/2007"),]

## set up 4x4 frame and open the file device

png(filename="plot4.png",width=480,height=480)
par(mfcol=c(2,2),mar=c(4,4,4,2))


## Create Object Filter 

dates = with(pwr,strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

## TOP LEFT Same as Plot 2, except we will add the y label and margins 

par(fg="black")
plot(dates,pwr$Global_active_power,type="l",
    ylab="Global Active Power",xlab="")

## LOWER LEFT - Same as plot 3, except for the margin and the border around the legend 

plot(dates,pwr$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(dates,pwr$Sub_metering_1,col="black")
lines(dates,pwr$Sub_metering_2,col="red")
lines(dates,pwr$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),
       lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       box.col="transparent",box.lwd=0,bg="transparent")

## TOP RIGHT - Similar to what we did for the top left plot but we will add the Voltage variable and the x label 

par(fg="black")
plot(dates,pwr$Voltage,type="l",
     ylab="Voltage",xlab="datetime")

## LOWER RIGHT- Similar to what we did for the top right plot, but we will add the Global_reactive_power variable

par(fg="black")
plot(dates,pwr$Global_reactive_power,type="l",
    ylab="Global_reactive_power",xlab="datetime")
    
    
## Close the File Device 

dev.off()





