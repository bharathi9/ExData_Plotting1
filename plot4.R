#code to read data

dataz <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
str(dataz)
dataz$datetime <- paste(dataz$Date, dataz$Time)
dataz$datetime <- strptime(dataz$datetime, format = "%d/%m/%Y %H:%M:%S")
dataz$newDate <- as.Date(dataz$datetime)
datas <- subset(dataz, dataz$newDate %in% as.Date(c("2007-02-01","2007-02-02")))
nrow(datas)
datas$Global_active_power <- as.numeric(datas$Global_active_power)
datas$Sub_metering_1 <- as.numeric(datas$Sub_metering_1)
datas$Sub_metering_2 <- as.numeric(datas$Sub_metering_2)
datas$Global_reactive_power <- as.numeric(datas$Global_reactive_power)
datas$Voltage <- as.numeric(datas$Voltage)
str(datas)

#code to plot

par (mfrow=c(2,2))
plot(datas$datetime, datas$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab="")
plot(datas$datetime, datas$Voltage, type = "l",ylab = "Voltage",xlab="datetime")
with(datas,plot(datas$datetime,datas$Sub_metering_1,col = "black",type="l",ylab="Energy sub metering"))
lines(datas$datetime,datas$Sub_metering_2,col="red",type="l")
lines(datas$datetime,datas$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
plot(datas$datetime, datas$Global_reactive_power, type = "l",ylab = "Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off()
