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
par(mfrow=c(2,2))
#this is plot1
plot(mydata1$DateTime,mydata1$Global_active_power,ylab="Global Active Power(kW)",xlab="",type="l")
#this is plot2
plot(mydata1$DateTime,mydata1$Voltage,ylab="Voltage",xlab="DateTime",type="l")
#this is plot 3
plot(mydata1$DateTime,mydata1$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")+points(mydata1$DateTime,mydata1$Sub_metering_2,type="l",col="red")+points(mydata1$DateTime,mydata1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),text.col=c("black","red","blue"),lty=c(1,1),bty="n",cex=0.5)
#this is plot 4
hist(mydata1$Global_active_power,xlab="Global Active Power(kW)",col="red",main="Global Active Power")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()