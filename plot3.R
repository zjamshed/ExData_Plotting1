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
plot(mydata1$DateTime,mydata1$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")+points(mydata1$DateTime,mydata1$Sub_metering_2,type="l",col="red")+points(mydata1$DateTime,mydata1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("sub metering 1", "sub metering 2", "sub metering 3"),text.col=c("black","red","blue"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()