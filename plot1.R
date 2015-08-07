
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
mydata1<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")

#changing columns to numeric
mydata1$Global_active_power<-as.numeric(as.character(mydata1$Global_active_power))
mydata1$Global_reactive_power<-as.numeric(as.character(mydata1$Global_reactive_power))
mydata1$Global_intensity<-as.numeric(as.character(mydata1$Global_intensity))
mydata1$Voltage<-as.numeric(as.character(mydata1$Voltage))
mydata1$Sub_metering_1<-as.numeric(as.character(mydata1$Sub_metering_1))
mydata1$Sub_metering_2<-as.numeric(as.character(mydata1$Sub_metering_2))
mydata1$Sub_metering_3<-as.numeric(as.character(mydata1$Sub_metering_3))
mydata1$DateTime <- strptime(paste(mydata1$Date, mydata1$Time), "%d/%m/%Y %H:%M:%S")

#this is the plot
hist(mydata1$Global_active_power,xlab="Global Active Power(kW)",col="red",main="Global Active Power")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()