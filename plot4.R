#the following is to load data
powerData<-read.csv("household_power_consumption.txt",sep = ";")
#the following is merge time with date before conversion
powerData$Time<-  paste(powerData$Date, powerData$Time, sep=" ")
#the following is merge time and date  conversion

powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")
powerData$Time<-strptime(powerData$Time,format = "%d/%m/%Y %H:%M:%S")

#the following is to prepare active power by kilo watt

powerData$Global_active_power<-as.numeric(powerData$Global_active_power)/1000
powerData$Global_reactive_power<-as.numeric(powerData$Global_reactive_power)/400
powerData$Voltage<-as.numeric(powerData$Voltage)
#the following is to do data subsetting

powerData<-powerData[powerData$Date >= as.Date("01/02/2007",format="%d/%m/%Y") & powerData$Date <= as.Date("02/02/2007",format="%d/%m/%Y"),]
#the following is prepration for device
png(file="plot4.png",width = 480,height = 480)
#this is for partitioning
par(mfrow=c(2,2))
#the following is the first picture
plot(powerData$Time,powerData$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab=" ")

#hist(powerDataTemp, xlab = "Global Active Power (kilowatts)",main="Global Active Power",col = "red",breaks=seq(0,6,by=.25))
#the following is the second picture
plot(powerData$Time,powerData$Voltage/8,type="l",ylab = "Voltage",xlab="datetime")
#plot(powerData$Time,powerData$Global_reactive_power,type="l",ylab = "Global_rective_Power",xlab="datetime")


#the following is the third picture
with(powerData,plot(powerData$Time,powerData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" "))
with(powerData,lines(powerData$Time,powerData$Sub_metering_2,col="red"))
with(powerData,lines(powerData$Time,powerData$Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"),lwd=c(2.5,2.5,2.5))
#the following is the fourth picture
plot(powerData$Time,powerData$Global_reactive_power,type="l",ylab = "Global_rective_Power",xlab="datetime")

dev.off()
