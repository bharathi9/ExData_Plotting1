#code to read data

dataz <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
str(dataz)
dataz$datetime <- paste(dataz$Date, dataz$Time)
dataz$datetime <- strptime(dataz$datetime, format = "%d/%m/%Y %H:%M:%S")
dataz$newDate <- as.Date(dataz$datetime)
datas <- subset(dataz, dataz$newDate %in% as.Date(c("2007-02-01","2007-02-02")))
nrow(datas)

#code to plot

datas$Sub_metering_1 <- as.numeric(datas$Sub_metering_1)
datas$Sub_metering_2 <- as.numeric(datas$Sub_metering_2)
str(datas)
with(datas,plot(datas$datetime,datas$Sub_metering_1,col = "black",type="l",ylab="Energy sub metering"))
lines(datas$datetime,datas$Sub_metering_2,col="red",type="l")
lines(datas$datetime,datas$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()

