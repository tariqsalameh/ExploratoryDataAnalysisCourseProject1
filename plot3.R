
#the following is to load data
powerData<-read.csv("household_power_consumption.txt",sep = ";")
#the following is merge time with date before conversion
powerData$Time<-  paste(powerData$Date, powerData$Time, sep=" ")
#the following is merge time and date  conversion

powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")
powerData$Time<-strptime(powerData$Time,format = "%d/%m/%Y %H:%M:%S")

#the following is to prepare active power by kilo watt

powerData$Global_active_power<-as.numeric(powerData$Global_active_power)/1000

#the following is to do data subsetting

powerData<-powerData[powerData$Date >= as.Date("01/02/2007",format="%d/%m/%Y") & powerData$Date <= as.Date("02/02/2007",format="%d/%m/%Y"),]

#the following is to draw the graph

png(file="plot3.png",width = 480,height = 480)
with(powerData,plot(powerData$Time,powerData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" "))
with(powerData,lines(powerData$Time,powerData$Sub_metering_2,col="red"))
with(powerData,lines(powerData$Time,powerData$Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"),lwd=c(2.5,2.5,2.5))

dev.off()
