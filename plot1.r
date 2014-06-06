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


#plot 1
names(data1)
attach(data1)

png(file = "plot1.png")
par(mfrow=c(1,1))
hist(as.numeric(Global_active_power)/1000 , main = c("Global Active Power") , xlab="Global Active Power (kilowatts)", col="red")
dev.off()
