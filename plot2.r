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


#plot 2
names(data1)
attach(data1)
png(filename="plot2.png",width=480,height=480,units="px")
par(mfrow=c(1,1))
plot(data1$date,as.numeric(data1$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
