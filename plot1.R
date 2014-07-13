# Code to read the data

dataz <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
str(dataz)
dataz$datetime <- paste(dataz$Date, dataz$Time)
dataz$datetime <- strptime(dataz$datetime, format = "%d/%m/%Y %H:%M:%S")
dataz$newDate <- as.Date(dataz$datetime)
datas <- subset(dataz, dataz$newDate %in% as.Date(c("2007-02-01","2007-02-02")))
nrow(datas)

#code for the plot

datas$Global_active_power <- as.numeric(datas$Global_active_power)
hist(datas$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red", main = "Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
