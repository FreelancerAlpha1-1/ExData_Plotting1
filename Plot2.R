## IMPORTANT! From plot2 to plot4, I will be utilizing the R package "data.table". As such, in order for you to reproduce these plots, it will be necessary for you to download the package, if you have not already done so, by typing in library(data.table)

## After downloading and unzipping the file we will now set up our working directory 

setwd("C://mydocuments/ExData_Plotting1")

## We will now read the data from our working directory

data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## For our plot, we will now filter the dates from 2007-02-01 to 2007-02-02

pwr = data[data$Date %in% c("2/2/2007","1/2/2007"),]

## Now we will create an object vector with the dates

dates = with(pwr,strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

## Now we will finally create our plot 

png(filename="plot2.png",width=480,height=480)
par(fg="black",mar=c(3,4,2,2))
plot(dates,pwr$Global_active_power,type="l",ylab="Global Active Power (killowatts)",xlab="")
dev.off()





