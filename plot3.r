#reading data
data=read.table("household_power_consumption.txt",sep=";",header=TRUE)

#converting date, subseting by date
class(data$Date)
class(data$Time)
time=paste(data$Date,data$Time)
date=strptime(time,format="%d/%m/%Y %H:%M:%S")
summary(date)
data=data.frame(data,date)

data1=data[date$year==107 & date$mon==1 & (date$mday==1 | date$mday==2),]
head(data1)
tail(data1)


#plot 3
names(data1)
attach(data1)
png(filename="plot3.png",width=480,height=480,units="px")
par(mfrow=c(1,1))
plot(data1$date,as.numeric(data1$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(data1$date,as.numeric(data1$Sub_metering_2),col="red")
lines(data1$date,as.numeric(data1$Sub_metering_3),col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
