
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

png(file="plot1.png",width = 480,height = 480)
hist(powerDataTemp, xlab = "Global Active Power (kilowatts)",main="Global Active Power",col = "red",breaks=seq(0,6,by=.25))

dev.off()
