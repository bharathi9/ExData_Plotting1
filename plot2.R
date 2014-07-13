#code to read data

dataz <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
str(dataz)
dataz$datetime <- paste(dataz$Date, dataz$Time)
dataz$datetime <- strptime(dataz$datetime, format = "%d/%m/%Y %H:%M:%S")
dataz$newDate <- as.Date(dataz$datetime)
datas <- subset(dataz, dataz$newDate %in% as.Date(c("2007-02-01","2007-02-02")))
nrow(datas)

#code for plot

datas$Global_active_power <- as.numeric(datas$Global_active_power)
with(datas, plot(datas$datetime, datas$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab=""))
dev.copy(png,file="plot2.png")
dev.off()
